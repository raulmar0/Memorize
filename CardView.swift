//
//  CardView.swift
//  Memorize
//
//  Created by Raul Hernandez on 08/03/24.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    
    var body: some View {
        TimelineView(.animation) { timeline in
            if card.isFaceUp || !card.isMatched {
                Pie(endAngle: .degrees(card.bonusPercentRemaining * 360))
                    .opacity(Constants.Pie.opacity)
                    .overlay(cardContents.padding(Constants.Pie.inset))
                    .padding(Constants.inset)
                    .cardify(isFaceUp: card.isFaceUp)
                    .transition(.scale)
            } else {
                Color.clear
            }
        }
    }
    
    var cardContents: some View {
        Text(card.content)
            .font(.system(size: Constants.FontSize.largest))
            .minimumScaleFactor(Constants.FontSize.scaleFactor)
            .multilineTextAlignment(.center)
            .aspectRatio(1, contentMode: .fit)
            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
            .animation(.spin(duration: 1), value: card.isMatched)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: 0.8).repeatForever(autoreverses: false)
    }
}


#Preview {
//    typealias is breaking the preview, 
//    typealias Card = MemoryGame<String>.Card
    VStack {
        HStack {
            CardView(MemoryGame.Card(isFaceUp: true,content: "this is a very long string and i hope this fits", id: "test1"))
            CardView(MemoryGame.Card(content: "x", id: "test1"))
        }
        HStack {
            CardView(MemoryGame.Card(isFaceUp: true, isMatched: true, content: "x", id: "test1"))
            CardView(MemoryGame.Card(isMatched: true, content: "x", id: "test1"))
        }
    }
        .padding()
        .foregroundColor(.green)
}

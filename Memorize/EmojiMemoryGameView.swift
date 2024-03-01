//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Raul Hernandez on 26/01/24.
//

import SwiftUI

// View

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame // never equals when @ObservedObject
    
    let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            cards
                .animation(.bouncy, value: viewModel.cards)
//                    .background(.red)
            Button("Shuffle") {
                viewModel.shuffle()
            }
//            .background(Color.blue)
        }
//        .background(.yellow)
        .padding()
    }
    
    var cards: some View {
        
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            if card.id.last == "b" {
                VStack {
                    CardView(card)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                    Text(card.id)
                }
            }
            
//                    Text(card.id)
        }
        .foregroundColor(.orange)
        
    }
    
    
    
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
            
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}





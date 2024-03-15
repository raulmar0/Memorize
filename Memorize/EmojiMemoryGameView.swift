//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Raul Hernandez on 26/01/24.
//

import SwiftUI

// View

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    @ObservedObject var viewModel: EmojiMemoryGame // never equals when @ObservedObject
    
    let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            cards
                .foregroundColor(viewModel.color)
//                .animation(.bouncy, value: viewModel.cards)
            HStack {
                score
                Spacer()
                shuffle
            }
            .font(.largeTitle)
        }
        .padding()
    }
    
    private var score: some View {
        Text("Score: \(viewModel.score)")
            .animation(nil)
    }
    
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation(.easeInOut(duration: 2)) {
                viewModel.shuffle()
            }
        }
    }
    
    var cards: some View {
        
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
//            if card.id.last == "b" {
            if true {
                VStack {
                    CardView(card)
                        .padding(spacing)
                        .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                        .onTapGesture {
                            withAnimation {
                                viewModel.choose(card)
                            }
                        }
//                    Text(card.id)
                }
                .padding(4)
            }
        }
        .foregroundColor(viewModel.color)
        
    }
    
    private func scoreChanged(causedBy card: Card) -> Int {
        return 0
    }
    
    
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}






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
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            cards
                .foregroundColor(viewModel.color)
                .animation(.bouncy, value: viewModel.cards)
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
//            if card.id.last == "b" {
            if true {
                VStack {
                    CardView(card)
                        .padding(spacing)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
//                    Text(card.id)
                }
                .padding(4)
            }
        }
        .foregroundColor(viewModel.color)
        
    }
    
    
    
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}






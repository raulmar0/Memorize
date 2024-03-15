//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Raul Hernandez on 09/02/24.
//

import SwiftUI


// ViewModel
// Aquí se crea
class EmojiMemoryGame: ObservableObject {
//   Not working
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♂️","🙀","👹","😱","☠️","🍭"] // EmojiMemoryGame.emojis in the global namespace
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    
    
    var cards: [Card] {
        model.cards
    }
    
    var color: Color {
        .orange
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }

    func choose(_ card: Card) {
        model.choose(card)
    }
}

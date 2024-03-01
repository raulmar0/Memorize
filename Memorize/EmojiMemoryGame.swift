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
    private static let emojis = ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♂️","🙀","👹","😱","☠️","🍭"] // EmojiMemoryGame.emojis in the global namespace
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 10) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

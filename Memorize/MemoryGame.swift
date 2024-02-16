//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Raul Hernandez on 09/02/24.
//

import Foundation

// Model
// Este es genérico
struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards =  []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    // MemoryGame.Card in namespace
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}

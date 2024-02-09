//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Raul Hernandez on 09/02/24.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    // MemoryGame.Card in namespace
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
}

//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Raul Hernandez on 26/01/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

//
//  ContentView.swift
//  Memorize
//
//  Created by Raul Hernandez on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    
//        [String] is the same type as Array<String>
    let emojis = ["👻","🎃","🕷️","😈"]
    
    var body: some View {
        HStack {
//            0..<4 is a range containing 0,1,2,3
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}

// Views are immutable
struct CardView: View {
    
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                base.fill()
            }
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}



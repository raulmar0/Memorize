//
//  ContentView.swift
//  Memorize
//
//  Created by Raul Hernandez on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
    }
}

#Preview {
    ContentView()
}

// Views are immutable
struct CardView: View {
//    Temporary state, not actual logic
    @State var isFaceUp: Bool = false
    var body: some View {
//        let is for constants
//        let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
        let base = RoundedRectangle(cornerRadius: 12)
          
//        Trailing closure syntax
//        ZStack(alignment: .top) {
//            /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
//        })
        
//        Old fashioned
        ZStack(content: {
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                base.fill()
            }
            
        }).onTapGesture {
            isFaceUp.toggle()
//            isFaceUp = !isFaceUp also works
        }
    }
}



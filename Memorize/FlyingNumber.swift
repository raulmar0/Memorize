//
//  FlyingNumber.swift
//  Memorize
//
//  Created by Raul Hernandez on 15/03/24.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    var body: some View {
        if number != 0 {
            Text("\(number, format: .number)")
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}

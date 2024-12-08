
//
//  Themes.swift
//  MemoryGame
//
//  Created by student on 05/12/2024.
//

import SwiftUI

struct Themes: View {
    
    var motyw: String
    var tekst: String

    let action: () -> Void
    
    var body: some View {
        VStack{
            Text(motyw)
            Button(action: action, label: {
                    Text(tekst)
            })
        }
    }
}

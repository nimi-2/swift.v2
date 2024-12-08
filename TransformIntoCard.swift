//
//  TransformIntoCard.swift
//  MemoryGame
//
//  Created by student on 06/12/2024.
//

import Foundation
import SwiftUI

struct TransformIntoCard: ViewModifier {
    
    var isFaceUp: Bool = false
    var color: Color = .red
    func body(content: Content) -> some View {
        ZStack{
            
            let base = RoundedRectangle(cornerRadius: 12)
            
            base
                .fill(.white)
                .stroke(Color.purple, lineWidth:5)
                
                .overlay(content)
            
                
            base.fill(color)
                
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(isFaceUp ? 0 : 180), axis: (0,1,0))
        .animation(.easeInOut(duration: 2), value: !isFaceUp)

    }
}


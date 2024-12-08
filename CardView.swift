

//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 05/12/2024.
//

import SwiftUI

struct CardView: View {
    var color: Color = .blue
    var card: MemoGameModel<String>.Card
    var body: some View {
        CirclePart(endAngle: .degrees(120))
            .fill(color)
            
            .overlay(
                Text(card.content)
                .font(.system(size: 100))
                .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                .animation(card.isMatched ? .spin(duration: 2) : .default, value: card.isMatched)
               
            )
            .padding()
            .modifier(TransformIntoCard(isFaceUp: card.isFaceUp,color :color))
        
            .opacity(card.visible ? 1 : 0)
            
           
    }
    
}

#Preview {
    CardView(card: MemoGameModel<String>.Card(isFaceUp: true, id: "", content: ""))
}




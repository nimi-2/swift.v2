
//
//  FlyingNumber.swift
//  MemoryGame
//
//  Created by student on 07/12/2024.
//

import SwiftUI

struct FlyingNumber: View {
    var score: Int = 0
    @State var offset: CGFloat = -50
    var body: some View {
        Text("Score: \(score)")
            .font(.title2)
            .foregroundStyle(score < 0 ? .red : .blue)
            .shadow(color: .black, radius: 5, x: 2, y: 2)
            .offset(x: offset)
            
            .opacity(score != 0 ? 0 : 1)
            .onAppear {
                withAnimation(.linear(duration: 1.5)) {
                    offset = 0
                }
            }
            .onDisappear {
                withAnimation(.linear(duration: 1.5)) {
                    offset = -50
                }
            }
            
    }
}

#Preview {
    FlyingNumber(score: 0)
}

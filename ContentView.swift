//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 05/12/2024.
//

import SwiftUI



import Charts

struct ContentView: View {
    @ObservedObject var model: MemoGameViewModel
    
    @State var cardTheme: Color = .red
    
    var tab = [1...10]
    @State var count = 7
    var cards: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
            ForEach(model.cards){
                card in 
                CardView(color: cardTheme, card: card)
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture {
                        model.choose(card: card)
                            
                }
            }
            
        }
        .padding()
    }
    
    var mainCard: some View{
        
//        if let main = model.getMainCard() {
//            return CardView(card: main)
//        }
//        
//        return EmptyView()

        CardView(color: cardTheme, card: model.getMainCard()!)
            .aspectRatio(1, contentMode: .fill)
            .padding()
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) {
        count += offset
    }
    
    var buttons: some View {
        HStack {
            Themes(motyw: "emo", tekst: "xd") {
                model.changeTheme(index: 0)
                cardTheme = .red
            }
                
            Themes(motyw: "emo", tekst: "xd") {
                model.changeTheme(index: 1)
                cardTheme = .green
            }
                
            Themes(motyw: "emo", tekst: "xd") {
                model.changeTheme(index: 2)
                cardTheme = .blue
            }
                
        }
    }
    
    var body: some View {
        VStack {
            FlyingNumber(score: model.getScore())
                
            
            mainCard
            ScrollView {
                cards
            }
            Spacer()
            buttons
            Spacer()
            HStack {
                Button(action: {
                    adjustCardNumber(by: 1, symbol: "")
                }, label: {
                    Text("+")
                        .font(.largeTitle)
                })
                
                Button(action: {
                    adjustCardNumber(by: -1, symbol: "")
                }, label: {
                    Text("-")
                        .font(.largeTitle)
                })
            }
        }
        
        
    
        
        
        
    }
}

#Preview {
    ContentView(model: MemoGameViewModel())
}


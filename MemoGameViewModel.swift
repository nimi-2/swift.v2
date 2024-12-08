
//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 05/12/2024.
//

import Foundation

class MemoGameViewModel : ObservableObject {
    
    @Published var model = createMemoGame()
    var cards: Array<MemoGameModel<String>.Card>{model.cards}
    
    func getMainCard() -> MemoGameModel<String>.Card?{
        return model.mainCard
    }
    
    private static let emojis: [[String]?] = [
        ["1","2","3","4","5","6"],
        ["a","b","c","d","e","f"],
        ["!","@","#","$","%","^"]
    ]
    
    func getScore() -> Int{
        return model.score
    }
    

    static func  createMemoGame(whichTheme: Int = 0) -> MemoGameModel<String> {
        // dany motyw istnieje
        guard let pairCount = emojis[whichTheme]?.count else {
            fatalError("??")
        }
        return MemoGameModel<String>(numberOfCards: pairCount) {
            index in
            //
            let chosenEmojis = emojis[whichTheme]!
            
            // czy tablica zawiera  element o danym indexie
            if chosenEmojis.indices.contains(index) {
                print(chosenEmojis[index])
                return chosenEmojis[index]
            } else {
                return "??"
            }
            
        }
    }
    
    func changeTheme(index: Int){
        model = MemoGameViewModel.createMemoGame(whichTheme: index)
    }
    
    func choose(card: MemoGameModel<String>.Card) {
        model.choose(card: card)
    }
    
    
}



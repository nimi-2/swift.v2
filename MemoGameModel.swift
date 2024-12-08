
//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by student on 05/12/2024.
//

import Foundation


struct MemoGameModel<CardContent : Equatable> {

    private(set) var cards: Array<Card>
    private(set) var mainCard: Card? = nil
    private(set) var score: Int = 0
    
    
    init(numberOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        let randoms = Int.random(in: 0..<numberOfCards)
        for i in 0..<numberOfCards {
            let content = cardContentFactory(i)
            cards.append(Card(id: "\(UUID())", content: content))
            if(i == randoms){
        
                mainCard = Card(isFaceUp: true, id: "1", content: content)
            }
        }
        cards.shuffle()
        
        
    }
    
    mutating func addScore() {
        score += 10
    }
    
    mutating func minusScore() {
        score -= 1
    }
    
    func index(card: Card) -> Int?{
        for index in cards.indices{
            if(cards[index].id == card.id) {
                return index
            }
        }
        return nil
    }
    
    func indexFace(card: Card)->Int?{
        for index in cards.indices{
            if(cards[index].isFaceUp){
                if(cards[index].id != card.id){
                    return index
                }
            }
                
        }
        return nil
    }
    
    mutating func getNewMainCard() {
        let randoms = Int.random(in: 0..<cards.count)
        // index, czy karta w cards jest juz matched z tym symbolem jezeli nie to to bedzie nowa maincard
        for index in cards.indices {
            if cards[index].content != cards[randoms].content {
                if !cards[index].isMatched {
                    mainCard = Card(isFaceUp: true, id: "1", content: cards[index].content)
                    
                    return 
                }
            }
        }
//        mainCard = Card(isFaceUp: true, id: "1", content: content)
        
    }
    
    mutating func choose(card: Card) {

        if let index = indexFace(card: card) {
            cards[index].isFaceUp = false
        }
        if let index = index(card: card){
            cards[index].isFaceUp = true
        }
        
        if let index = index(card: card), mainCard?.content == cards[index].content{
//            mainCard?.isMatched = true
            cards[index].isMatched = true
            cards[index].visible = false
            getNewMainCard()
            addScore()
            return
//            for cardIndex in cards.indices {
//                if !cards[cardIndex].isMatched {
//                    cards[cardIndex].visible = false
//                }
//                
//            }
        }
        minusScore()
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card : Equatable, Identifiable  {
        var isFaceUp = false
        var isMatched = false
        var visible = true
        var id: String
        let content: CardContent
    }
}

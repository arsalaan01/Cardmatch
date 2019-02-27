//
//  Cardmatch.swift
//  Cardmatch
//
//  Created by Arsalaan Ali on 27/02/19.
//  Copyright © 2019 Arsalaan Ali. All rights reserved.
//

import Foundation
class Cardmatch {
//var cards =  Array<Card>()
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    func chooseCard(at index:Int){
        /*if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        }else{
            cards[index].isFaceUp = true
        }*/
        if !cards[index].isMatched{
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                //Check if card match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    init(numberOfPairsOfCards:Int) {
        for _ in 1...numberOfPairsOfCards {
            
            let card = Card()
            //let matchingCard = Card(identifier: identifier)
            //cards.append(card)
            //cards.append(card)
            cards += [card,card]
            
        
        }
        //Todo:Shuffle the cards
 }
}

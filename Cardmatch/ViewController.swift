//
//  ViewController.swift
//  Cardmatch
//
//  Created by Arsalaan Ali on 26/02/19.
//  Copyright © 2019 Arsalaan Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    lazy var game = Cardmatch(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var flipCount = 0 {
        didSet {
            flipCountLabel.text =  "Flips: \(flipCount)"
        }
    }
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
   
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
           // flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        }else{
            print("Chosen card was not in card buttons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for:card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)           }
        }
    }
     var emojiChoices = ["🎃","👻","👑","🐬","🐙","🤡","🐠","🦋","❄️","🦄"]
    
    //var emoji = Dictionary<Int,String>()
    var emoji = [Int:String]()
    func emoji(for card: Card) ->String{
        /*if emoji[card.identifier] != nil{
            return emoji[card.identifier]!
        }else{
            return "?"
        } */
        //same as above commented code
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                //emoji[card.identifier] = emojiChoices[randomIndex]
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            
        }
        return emoji[card.identifier] ?? "?"
    }

 
}


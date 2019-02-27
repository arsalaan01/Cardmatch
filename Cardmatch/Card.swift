//
//  Card.swift
//  Cardmatch
//
//  Created by Arsalaan Ali on 27/02/19.
//  Copyright © 2019 Arsalaan Ali. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    static var indentifierFacotry = 0
    
    static func getUniqueIdentifier() -> Int{
        indentifierFacotry += 1
        return indentifierFacotry
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}

//
//  MemoryGame.swift
//  Memorize
//
//  Created by Murch Direct on 11/2/20.
//  Copyright © 2020 mdirect. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return -1   // TODO: bogus!
    }
    
    init (nimberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<nimberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: 2 * pairIndex, content: content))
            cards.append(Card(id: 2 * pairIndex + 1, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}

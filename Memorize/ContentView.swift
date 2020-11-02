//
//  ContentView.swift
//  Memorize
//
//  Created by Murch Direct on 10/13/20.
//  Copyright © 2020 mdirect. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.green)
            .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 15.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 15.0).stroke(lineWidth: 6)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 15.0).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}

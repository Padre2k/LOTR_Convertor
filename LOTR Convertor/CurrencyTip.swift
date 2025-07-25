//
//  CurrencyTip.swift
//  LOTR Convertor
//
//  Created by Ethan Faggett on 6/13/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency to change the currency.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
    
    
}

//
//  ExchangeRate.swift
//  LOTR Convertor
//
//  Created by Ethan Faggett on 6/12/25.
//

import SwiftUI

struct ExchangeRate: View {
    
    let leftImage: ImageResource
    let rightImage: ImageResource
    let descriptionText: String
    
    
    
    var body: some View {
        HStack{
            
            // Left Currency Image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange Rate Text
            Text(descriptionText)
            
            
            // Right Currency Image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            
            
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpenny, rightImage: .goldpiece, descriptionText: "1 Silver Piece = 4 Silver Pennies")
}

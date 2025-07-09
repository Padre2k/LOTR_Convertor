//
//  SelectCurrency.swift
//  LOTR Convertor
//
//  Created by Ethan Faggett on 6/12/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        
        ZStack{
            // Parchment Background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                // Text
                Text("Select the currency that you are starting with:")
                    .fontWeight(.bold)
                
               
                // Currency Icons
//
                IconGrid(currency: $topCurrency)
                
                
                
                // Text
                Text("Select the currency that you would like to switch to:")
                    .fontWeight(.bold)
                    .padding(.top)
                    
                
                // Currency Icons
                IconGrid(currency: $bottomCurrency)
                
                
                // Done Button
                Button("Done") {
                    dismiss()
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
                
            }
            .padding(10)
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
            
            
            
        }
        
       
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .silverPenny
    
    @Previewable @State var bottomCurrency: Currency = .goldPenny
    
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}

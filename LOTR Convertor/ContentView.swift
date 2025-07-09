//
//  ContentView.swift
//  LOTR Convertor
//
//  Created by Ethan Faggett on 6/12/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    let currencyTip = CurrencyTip()
    
    let defaults = UserDefaults.standard
    
    
    var body: some View {
        ZStack {
            
         
               // .ignoresSafeArea() // Extend to screen edges
           // Background Image
            Image(.background)
                .resizable() // Allow image to be resized
                .ignoresSafeArea()
               
            VStack{
                // Prancing Pony Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                
                // Currency Exchange Text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Conversion Section
                
                HStack{
                    // Left Conversion Section
                    
                    VStack{
                        // Currency
                        
                        HStack{
                            // Currency Image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency Text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                        // Text Field
//                        Text("Text Field")
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .onChange(of: leftAmount) {
                                if leftTyping {
                                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                                }
                            }
                        
                        
                    }
                    
                    
                    // Equal Sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right Conversion Section
                    
                    VStack{
                        // Currency
                        
                        HStack{
                            // Currency Text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
//                        Text("Text Field")
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .onChange(of: rightAmount) {
                                if rightTyping {
                                    leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                                }
                            }
                    }
                    
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.decimalPad)
                
                Spacer()
                
                //Info Button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                        
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                    .sheet(isPresented: $showSelectCurrency)      {
                        SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                    }
                }
                
            }
            
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
//        .border(.red)
    }
        
}

#Preview {
    ContentView()
}

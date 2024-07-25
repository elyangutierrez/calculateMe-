//
//  ContentView.swift
//  CalculateMe!
//
//  Created by Elyan Gutierrez on 7/24/24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @State private var calculationText = "0"
    @State private var currentNumber = ""
    @State private var result = 0.0
    @State private var darkModeOn = true
    
    let backgroundColor = Color(red: 0.1, green: 0.11, blue: 0.14)
    
    let lightWhiteButtonColor = Color(red: 0.8, green: 0.8, blue: 0.8)
    let darkGreyButtonColor = Color(red: 0.19, green: 0.19, blue: 0.19)
    let creamOrangeButtonColor = Color(red: 0.8, green: 0.5, blue: 0.1)
    
    var body: some View {
        ZStack {
            
            if darkModeOn == true {
                backgroundColor
                    .ignoresSafeArea()
            } else {
                Color.white
                    .ignoresSafeArea()
            }
            
            VStack {
                Image(systemName: darkModeOn ? "sun.max.fill" : "moon.stars.fill")
                    .resizable()
                    .foregroundStyle(lightWhiteButtonColor)
                    .frame(width: 30, height: 30)
                    .offset(x: 173, y: -320)
            }
            .onTapGesture {
                darkModeOn.toggle()
            }
            
            VStack {
                
                Spacer()
                    .frame(height: 175)
                
                
                VStack(alignment: .trailing) {
                    
                    Text("\(calculationText)")
                        .font(.system(size: 28))
                        .foregroundStyle(darkModeOn ? .gray : .black)
                        .padding(.vertical, 7)
                    
                    
                    Text("\(result.formatted())")
                        .font(.system(size: 45).bold())
                        .foregroundStyle(darkModeOn ? .white : .black)
                }
                .frame(maxWidth: .infinity, alignment: .topTrailing)
                .padding(.horizontal, 17)
                
                Spacer()
                    .frame(height: 35)
                
                VStack {
                    FirstRowView(lightWhiteButtonColor: lightWhiteButtonColor, creamOrangeButtonColor: creamOrangeButtonColor, calculationText: $calculationText, darkModeOn: $darkModeOn, currentNumber: $currentNumber, result: $result)
                    
                    SecondRowView(darkGreyButtonColor: darkGreyButtonColor, creamOrangeButtonColor: creamOrangeButtonColor, calculationText: $calculationText, darkModeOn: $darkModeOn, currentNumber: $currentNumber)
                    
                    ThirdRowView(darkGreyButtonColor: darkGreyButtonColor, creamOrangeButtonColor: creamOrangeButtonColor, calculationText: $calculationText, darkModeOn: $darkModeOn, currentNumber: $currentNumber)
                    
                    FourthRowView(darkGreyButtonColor: darkGreyButtonColor, creamOrangeButtonColor: creamOrangeButtonColor, calculationText: $calculationText, darkModeOn: $darkModeOn, currentNumber: $currentNumber)
                    
                    FifthRowView(darkGreyButtonColor: darkGreyButtonColor, creamOrangeButtonColor: creamOrangeButtonColor, calculationText: $calculationText, darkModeOn: $darkModeOn, currentNumber: $currentNumber, result: $result)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

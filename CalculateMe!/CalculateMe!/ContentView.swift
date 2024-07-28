//
//  ContentView.swift
//  CalculateMe!
//
//  Created by Elyan Gutierrez on 7/24/24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @State private var calculationText = ""
    @State private var currentNumber = ""
    @State private var result = 0.0
    @State private var darkModeOn = true
    
    let backgroundColor = Color(red: 0.1, green: 0.11, blue: 0.14)
    
    let lightWhiteButtonColor = Color(red: 0.8, green: 0.8, blue: 0.8)
    let darkGreyButtonColor = Color(red: 0.19, green: 0.19, blue: 0.19)
    let creamOrangeButtonColor = Color(red: 0.8, green: 0.5, blue: 0.1)
    
    @State private var showHistoryView = false
    @State private var showOtherOperators = false
    
    var body: some View {
        ZStack {
            if darkModeOn == true {
                backgroundColor
                    .ignoresSafeArea()
            } else {
                LinearGradient(colors: [lightWhiteButtonColor, creamOrangeButtonColor.opacity(0.80)], startPoint: .top, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            }
            
            VStack {
                Image(systemName: darkModeOn ? "sun.max.fill" : "moon.stars.fill")
                    .resizable()
                    .foregroundStyle(darkModeOn ? .white : .black)
                    .frame(width: 30, height: 30)
                    .offset(x: 175, y: -320)
            }
            .onTapGesture {
                darkModeOn.toggle()
            }
            
            VStack {
                
                Spacer()
                    .frame(height: 175)
                
                
                VStack(alignment: .trailing) {
                    
                    Text("\(calculationText)")
                        .font(.system(size: 21))
                        .foregroundStyle(darkModeOn ? .gray : .black)
                        .padding(.vertical, 7)
                    
                    Text("\(result.formatted())")
                        .font(.system(size: 45).bold())
                        .foregroundStyle(darkModeOn ? .white : .black)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, alignment: .topTrailing)
                .padding(.horizontal, 17)
                
                Spacer()
                    .frame(height: 30)
                
                VStack(alignment: .leading) {
                    Text("Other")
                        .font(.system(size: 18).bold())
                        .foregroundStyle(darkModeOn ? .white : .black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 26.5)
                .onTapGesture {
                    showOtherOperators.toggle()
                }
                
                VStack {
                    
                    FirstRowView(lightWhiteButtonColor: lightWhiteButtonColor, creamOrangeButtonColor: creamOrangeButtonColor, calculationText: $calculationText, darkModeOn: $darkModeOn, currentNumber: $currentNumber, result: $result, moreOperators: $showOtherOperators)
                    
                    SecondRowView(darkGreyButtonColor: darkGreyButtonColor, creamOrangeButtonColor: creamOrangeButtonColor, calculationText: $calculationText, darkModeOn: $darkModeOn, currentNumber: $currentNumber, result: $result)
                    
                    ThirdRowView(darkGreyButtonColor: darkGreyButtonColor, creamOrangeButtonColor: creamOrangeButtonColor, calculationText: $calculationText, darkModeOn: $darkModeOn, currentNumber: $currentNumber, result: $result)
                    
                    FourthRowView(darkGreyButtonColor: darkGreyButtonColor, creamOrangeButtonColor: creamOrangeButtonColor, calculationText: $calculationText, darkModeOn: $darkModeOn, currentNumber: $currentNumber, result: $result)
                    
                    FifthRowView(darkGreyButtonColor: darkGreyButtonColor, creamOrangeButtonColor: creamOrangeButtonColor, calculationText: $calculationText, darkModeOn: $darkModeOn, currentNumber: $currentNumber, result: $result)
                }
                
                Spacer()
            }
        }
        .onChange(of: calculationText) {
            print(calculationText)
        }
    }
}

#Preview {
    ContentView()
}

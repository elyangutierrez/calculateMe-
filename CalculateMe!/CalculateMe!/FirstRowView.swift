//
//  FirstRowView.swift
//  CalculateMe!
//
//  Created by Elyan Gutierrez on 7/24/24.
//

import SwiftUI

struct FirstRowView: View {
    
    let lightWhiteButtonColor: Color
    let creamOrangeButtonColor: Color
    @Binding var calculationText: String
    @Binding var darkModeOn: Bool
    @Binding var currentNumber: String
    @Binding var result: Double
    
    var body: some View {
        HStack {
            // row 1
            Button(action: {
                calculationText = ""
                result = 0
            }) {
                Circle()
                    .fill(lightWhiteButtonColor)
                    .frame(width: 90)
                    .overlay {
                        Text("C")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.black)
                    }
            }
            .padding(.horizontal, 3)
            
            Button(action: {
                toggleNegation()
            }) {
                Circle()
                    .fill(lightWhiteButtonColor)
                    .frame(width: 90)
                    .overlay {
                        Image(systemName: "plus.forwardslash.minus")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.black)
                    }
            }
            .padding(.horizontal, 3)
            
            Button(action: {
                doPercentage()
            }) {
                Circle()
                    .fill(lightWhiteButtonColor)
                    .frame(width: 90)
                    .overlay {
                        Text("%")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.black)
                    }
            }
            .padding(.horizontal, 3)
            
            
            // Orange Button
            Button(action: {
                calculationText += " / "
            }) {
                Circle()
                    .fill(creamOrangeButtonColor)
                    .frame(width: 90)
                    .overlay {
                        Image(systemName: "divide")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
        }
    }
    
    func appendToExpression(_ value: String) {
        calculationText += value
        currentNumber += value
    }
    
    func toggleNegation() {
        if let number = Double(currentNumber) {
            let negatedNumber = -number
            calculationText = calculationText.replacingOccurrences(of: currentNumber, with: "\(negatedNumber)")
            currentNumber = "\(negatedNumber)"
        }
    }
    
    func doPercentage() {
        if let number = Double(currentNumber) {
            let percentedNumber = Double(number / 100)
            calculationText = calculationText.replacingOccurrences(of: currentNumber, with: "\(percentedNumber)")
            currentNumber = "\(percentedNumber)"
        }
    }
}

#Preview {
    FirstRowView(lightWhiteButtonColor: Color.white, creamOrangeButtonColor: Color.orange, calculationText: .constant(""), darkModeOn: .constant(true), currentNumber: .constant(""), result: .constant(0))
}

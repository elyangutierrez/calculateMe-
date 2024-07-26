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
                
                calculationText = calculationText.trimmingCharacters(in: .whitespacesAndNewlines)
                
                if calculationText == "inf" || calculationText == "-inf" {
                    calculationText = "ERROR"
                    result = 0
                } else if calculationText.last == "/" {
                    print("Prevented //")
                    calculationText.removeLast()
                    calculationText = calculationText.trimmingCharacters(in: .whitespacesAndNewlines)
                } else if calculationText.last == "*" || calculationText.last == "+" || calculationText.last == "-" {
                    calculationText = "0"
                    result = 0
                } else if calculationText.last == "." {
                    calculationText += "0"
                    calculationText += " / "
                } else {
                    calculationText += " / "
                }
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
        calculationText.insert(contentsOf: "-", at: calculationText.startIndex)
    }
    
    func doPercentage() {
        let exp = NSExpression(format: calculationText)
        var placeholder = 0.0
        if let getAnswer = exp.expressionValue(with: nil, context: nil) as? NSNumber {
            placeholder = Double(truncating: getAnswer) / 100
            calculationText = String(placeholder)
            result = placeholder
        }
    }
}

#Preview {
    FirstRowView(lightWhiteButtonColor: Color.white, creamOrangeButtonColor: Color.orange, calculationText: .constant(""), darkModeOn: .constant(true), currentNumber: .constant(""), result: .constant(0))
}

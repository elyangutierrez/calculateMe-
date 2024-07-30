//
//  FifthRowView.swift
//  CalculateMe!
//
//  Created by Elyan Gutierrez on 7/24/24.
//

import SwiftUI

struct FifthRowView: View {
    let darkGreyButtonColor: Color
    let creamOrangeButtonColor: Color
    @Binding var calculationText: String
    @Binding var darkModeOn: Bool
    @Binding var currentNumber: String
    @Binding var result: Double
    
    var tempResult = 0
    
    var body: some View {
        HStack {
            // row 5
            Button(action: {
                calculationText += "0"
            }) {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(darkModeOn ? darkGreyButtonColor : darkGreyButtonColor.opacity(0.60))
                    .frame(width: 190, height: 90)
                    .overlay {
                        Text("0")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 35)
                    }
            }
            .padding(.horizontal, 5)
            
            Button(action: {
                
                calculationText = calculationText.trimmingCharacters(in: .whitespacesAndNewlines)
                
                let lastThreeChars = calculationText.suffix(3)
                
                if calculationText.last == "." {
                    calculationText.removeLast()
                } else if lastThreeChars.contains(".") {
                    calculationText = calculationText
                } else {
                    calculationText += "."
                }
            }) {
                Circle()
                    .fill(darkModeOn ? darkGreyButtonColor : darkGreyButtonColor.opacity(0.60))
                    .frame(width: 90)
                    .overlay {
                        Text(".")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
            
            // Orange Button
            Button(action: {
                solveExpression()
            }) {
                Circle()
                    .fill(creamOrangeButtonColor)
                    .frame(width: 90)
                    .overlay {
                        Image(systemName: "equal")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
            .disabled(calculationText.last == "+" || calculationText.last == "-" || calculationText.last == "*" || calculationText.last == "/")
        }
    }
    
    func solveExpression() {
        
        calculationText = calculationText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        print("Last char for solving: \(calculationText.last ?? "X")")
        
        let lastTwoChars = calculationText.suffix(2)
        
        let lengthOfExpression = calculationText.count
        
        if lengthOfExpression <= 2 && lastTwoChars.contains("(") || lengthOfExpression <= 2 && lastTwoChars.contains(")") {
            calculationText = "ERROR"
            result = 0
        }
        
        if calculationText.contains("ERROR.") {
            calculationText = "ERROR"
            result = 0
        }
        
        if let lastChar = calculationText.last, "+-*/.".contains(lastChar) {
            calculationText += "0"
            print("Ended here.")
        } else if let lastChar = calculationText.last, ".".contains(lastChar) {
            calculationText += "0"
        } else if calculationText.contains("ERROR") {
            calculationText = "ERROR"
            result = 0
        }
        
        let openParenthesesCount = calculationText.filter { $0 == "(" }.count
        let closeParenthesesCount = calculationText.filter { $0 == ")" }.count
        
        if openParenthesesCount > closeParenthesesCount {
            calculationText += String(repeating: ")", count: openParenthesesCount-closeParenthesesCount)
        }
        
        switch calculationText {
        case "0.0 / 0":
            calculationText = "ERROR"
            result = 0
        case "1.0 / 0":
            calculationText = "ERROR"
            result = 0
        case "2.0 / 0":
            calculationText = "ERROR"
            result = 0
        case "3.0 / 0":
            calculationText = "ERROR"
            result = 0
        case "4.0 / 0":
            calculationText = "ERROR"
            result = 0
        case "5.0 / 0":
            calculationText = "ERROR"
            result = 0
        case "6.0 / 0":
            calculationText = "ERROR"
            result = 0
        case "7.0 / 0":
            calculationText = "ERROR"
            result = 0
        case "8.0 / 0":
            calculationText = "ERROR"
            result = 0
        case "9.0 / 0":
            calculationText = "ERROR"
            result = 0
        default:
            calculationText = calculationText
            result = 0
        }
        
        let exp = NSExpression(format: calculationText)
        
        print(calculationText.last!)
        
        if let getAnswer = exp.expressionValue(with: nil, context: nil) as? NSNumber {
            result = Double(truncating: getAnswer)
            calculationText = String(result)
            print("Calculated.")
        }
    }
}

#Preview {
    FifthRowView(darkGreyButtonColor: Color.gray, creamOrangeButtonColor: Color.orange, calculationText: .constant(""), darkModeOn: .constant(true), currentNumber: .constant(""), result: .constant(0))
}

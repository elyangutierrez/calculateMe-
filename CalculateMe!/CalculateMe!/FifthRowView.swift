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
                    .frame(width: 170, height: 90)
                    .overlay {
                        Text("0")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 30)
                    }
            }
            .padding(.horizontal, 15)
            
            Button(action: {
                calculationText += "."
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
        }
    }
    
    func solveExpression() {
        let exp = NSExpression(format: calculationText)
        if let getAnswer = exp.expressionValue(with: nil, context: nil) as? NSNumber {
            result = Double(truncating: getAnswer)
        }
    }
}

#Preview {
    FifthRowView(darkGreyButtonColor: Color.gray, creamOrangeButtonColor: Color.orange, calculationText: .constant(""), darkModeOn: .constant(true), currentNumber: .constant(""), result: .constant(0))
}

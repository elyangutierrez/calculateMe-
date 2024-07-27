//
//  SecondRowView.swift
//  CalculateMe!
//
//  Created by Elyan Gutierrez on 7/24/24.
//

import SwiftUI

struct SecondRowView: View {
    let darkGreyButtonColor: Color
    let creamOrangeButtonColor: Color
    @Binding var calculationText: String
    @Binding var darkModeOn: Bool
    @Binding var currentNumber: String
    @Binding var result: Double
    
    
    var body: some View {
        HStack {
            // row 2
            Button(action: {
                calculationText += "7"
            }) {
                Circle()
                    .fill(darkModeOn ? darkGreyButtonColor : darkGreyButtonColor.opacity(0.60))
                    .frame(width: 90)
                    .overlay {
                        Text("7")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
                
            }
            .padding(.horizontal, 3)
            
            Button(action: {
                calculationText += "8"
            }) {
                Circle()
                    .fill(darkModeOn ? darkGreyButtonColor : darkGreyButtonColor.opacity(0.60))
                    .frame(width: 90)
                    .overlay {
                        Text("8")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
            
            Button(action: {
                calculationText += "9"
            }) {
                Circle()
                    .fill(darkModeOn ? darkGreyButtonColor : darkGreyButtonColor.opacity(0.60))
                    .frame(width: 90)
                    .overlay {
                        Text("9")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
            
            // Orange Button
            Button(action: {
                
                calculationText = calculationText.trimmingCharacters(in: .whitespacesAndNewlines)
                
                if calculationText == "inf" || calculationText == "-inf" {
                    calculationText = "ERROR"
                    result = 0
                } else if calculationText.last == "." {
                    calculationText += "0"
                    calculationText += " * "
                } else if calculationText.last == "*" {
                    calculationText.removeLast()
                    calculationText = calculationText.trimmingCharacters(in: .whitespacesAndNewlines)
                } else if calculationText.last == "+" || calculationText.last == "-" || calculationText.last == "/" {
                    calculationText = "0"
                    result = 0
                } else {
                    calculationText += " * "
                }
            }) {
                Circle()
                    .fill(creamOrangeButtonColor)
                    .frame(width: 90)
                    .overlay {
                        Image(systemName: "multiply")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
            .disabled(calculationText == "")
        }
    }
}

#Preview {
    SecondRowView(darkGreyButtonColor: Color.gray, creamOrangeButtonColor: Color.orange, calculationText: .constant(""), darkModeOn: .constant(false), currentNumber: .constant(""), result: .constant(0))
}

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
    @Binding var moreOperators: Bool
    
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
            
            if moreOperators {
                Button(action: {
                    calculationText += "("
                }) {
                    Circle()
                        .fill(lightWhiteButtonColor)
                        .frame(width: 90)
                        .overlay {
                            Text("(")
                                .font(.system(size: 28).bold())
                                .foregroundStyle(.black)
                        }
                }
                .padding(.horizontal, 3)
            } else {
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
            }
            
            if moreOperators {
                Button(action: {
                    calculationText += ")"
                }) {
                    Circle()
                        .fill(lightWhiteButtonColor)
                        .frame(width: 90)
                        .overlay {
                            Text(")")
                                .font(.system(size: 28).bold())
                                .foregroundStyle(.black)
                        }
                }
                .padding(.horizontal, 3)
                .disabled(calculationText == "")
            } else {
                Button(action: {
                    let lastTwoChars = calculationText.suffix(2)
                    
                    if lastTwoChars.contains(".") {
                        calculationText = calculationText
                        result = 0
                    } else {
                        doPercentage()
                    }
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
                .disabled(calculationText == "" || calculationText == "-")
            }
            
            
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
            .disabled(calculationText == "" || calculationText.last == "(")
        }
    }
    
    func appendToExpression(_ value: String) {
        calculationText += value
        currentNumber += value
    }
    
    func toggleNegation() {
//        calculationText.insert(contentsOf: "-", at: calculationText.startIndex)
        calculationText += "-"
    }
    
    func doPercentage() {
        let exp = NSExpression(format: calculationText)
        var placeholder = 0.0
        
        if calculationText == "0" || calculationText == "" {
            calculationText = "0"
            result = 0
        } else {
            if let getAnswer = exp.expressionValue(with: nil, context: nil) as? NSNumber {
                placeholder = Double(truncating: getAnswer) / 100
                calculationText = String(placeholder)
                result = placeholder
            }
        }
    }
}

#Preview {
    FirstRowView(lightWhiteButtonColor: Color.white, creamOrangeButtonColor: Color.orange, calculationText: .constant(""), darkModeOn: .constant(true), currentNumber: .constant(""), result: .constant(0), moreOperators: .constant(true))
}

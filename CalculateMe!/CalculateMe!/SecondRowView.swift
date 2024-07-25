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
    
    
    var body: some View {
        HStack {
            // row 2
            Button(action: {
                if (calculationText.firstIndex(of: "0") != nil) {
                    calculationText = calculationText.replacingOccurrences(of: "0", with: "7")
                } else {
                    calculationText += "7"
                }
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
                if (calculationText.firstIndex(of: "0") != nil) {
                    calculationText = calculationText.replacingOccurrences(of: "0", with: "8")
                } else {
                    calculationText += "8"
                }
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
                if (calculationText.firstIndex(of: "0") != nil) {
                    calculationText = calculationText.replacingOccurrences(of: "0", with: "9")
                } else {
                    calculationText += "9"
                }
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
                calculationText += "*"
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
        }
    }
}

#Preview {
    SecondRowView(darkGreyButtonColor: Color.gray, creamOrangeButtonColor: Color.orange, calculationText: .constant(""), darkModeOn: .constant(false), currentNumber: .constant(""))
}

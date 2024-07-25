//
//  ThirdRowView.swift
//  CalculateMe!
//
//  Created by Elyan Gutierrez on 7/24/24.
//

import SwiftUI

struct ThirdRowView: View {
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
                    calculationText = calculationText.replacingOccurrences(of: "0", with: "4")
                } else {
                    calculationText += "4"
                }
            }) {
                Circle()
                    .fill(darkModeOn ? darkGreyButtonColor : darkGreyButtonColor.opacity(0.60))
                    .frame(width: 90)
                    .overlay {
                        Text("4")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
            
            Button(action: {
                if (calculationText.firstIndex(of: "0") != nil) {
                    calculationText = calculationText.replacingOccurrences(of: "0", with: "5")
                } else {
                    calculationText += "5"
                }
            }) {
                Circle()
                    .fill(darkModeOn ? darkGreyButtonColor : darkGreyButtonColor.opacity(0.60))
                    .frame(width: 90)
                    .overlay {
                        Text("5")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
            
            Button(action: {
                if (calculationText.firstIndex(of: "0") != nil) {
                    calculationText = calculationText.replacingOccurrences(of: "0", with: "6")
                } else {
                    calculationText += "6"
                }
            }) {
                Circle()
                    .fill(darkModeOn ? darkGreyButtonColor : darkGreyButtonColor.opacity(0.60))
                    .frame(width: 90)
                    .overlay {
                        Text("6")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
            
            // Orange Button
            Button(action: {
                if (calculationText.firstIndex(of: "0") != nil) {
                    calculationText = calculationText.replacingOccurrences(of: "0", with: "-")
                } else {
                    calculationText += "-"
                }
            }) {
                Circle()
                    .fill(creamOrangeButtonColor)
                    .frame(width: 90)
                    .overlay {
                        Image(systemName: "minus")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
        }
    }
}

#Preview {
    ThirdRowView(darkGreyButtonColor: Color.gray, creamOrangeButtonColor: Color.orange, calculationText: .constant(""), darkModeOn: .constant(true), currentNumber: .constant(""))
}

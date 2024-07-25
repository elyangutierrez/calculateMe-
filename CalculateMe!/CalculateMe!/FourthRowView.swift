//
//  FourthRowView.swift
//  CalculateMe!
//
//  Created by Elyan Gutierrez on 7/24/24.
//

import SwiftUI

struct FourthRowView: View {
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
                    calculationText = calculationText.replacingOccurrences(of: "0", with: "1")
                } else {
                    calculationText += "1"
                }
            }) {
                Circle()
                    .fill(darkModeOn ? darkGreyButtonColor : darkGreyButtonColor.opacity(0.60))
                    .frame(width: 90)
                    .overlay {
                        Text("1")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
            
            Button(action: {
                if (calculationText.firstIndex(of: "0") != nil) {
                    calculationText = calculationText.replacingOccurrences(of: "0", with: "2")
                } else {
                    calculationText += "2"
                }
            }) {
                Circle()
                    .fill(darkModeOn ? darkGreyButtonColor : darkGreyButtonColor.opacity(0.60))
                    .frame(width: 90)
                    .overlay {
                        Text("2")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
            
            Button(action: {
                if (calculationText.firstIndex(of: "0") != nil) {
                    calculationText = calculationText.replacingOccurrences(of: "0", with: "3")
                } else {
                    calculationText += "3"
                }
            }) {
                Circle()
                    .fill(darkModeOn ? darkGreyButtonColor : darkGreyButtonColor.opacity(0.60))
                    .frame(width: 90)
                    .overlay {
                        Text("3")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
            
            // Orange Button
            Button(action: {
                calculationText += "+"
            }) {
                Circle()
                    .fill(creamOrangeButtonColor)
                    .frame(width: 90)
                    .overlay {
                        Image(systemName: "plus")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
        }
    }
}

#Preview {
    FourthRowView(darkGreyButtonColor: Color.gray, creamOrangeButtonColor: Color.orange, calculationText: .constant(""), darkModeOn: .constant(true), currentNumber: .constant(""))
}

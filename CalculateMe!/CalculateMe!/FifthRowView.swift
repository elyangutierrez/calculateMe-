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
    
    var body: some View {
        HStack {
            // row 5
            Button(action: {
                
            }) {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(darkModeOn ? darkGreyButtonColor : darkGreyButtonColor.opacity(0.60))
                    .frame(width: 170, height: 80)
                    .overlay {
                        Text("0")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 30)
                    }
            }
            .padding(.horizontal, 5)
            
            Button(action: {
                //
            }) {
                Circle()
                    .fill(darkModeOn ? darkGreyButtonColor : darkGreyButtonColor.opacity(0.60))
                    .frame(width: 80)
                    .overlay {
                        Text(".")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
            
            // Orange Button
            Button(action: {
                //
            }) {
                Circle()
                    .fill(creamOrangeButtonColor)
                    .frame(width: 80)
                    .overlay {
                        Image(systemName: "equal")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
        }
    }
}

#Preview {
    FifthRowView(darkGreyButtonColor: Color.gray, creamOrangeButtonColor: Color.orange, calculationText: .constant(""), darkModeOn: .constant(true))
}

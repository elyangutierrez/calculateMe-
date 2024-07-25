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
    
    var body: some View {
        HStack {
            // row 1
            Button(action: {
                calculationText = ""
            }) {
                Circle()
                    .fill(lightWhiteButtonColor)
                    .frame(width: 80)
                    .overlay {
                        Text("C")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.black)
                    }
            }
            .padding(.horizontal, 3)
            
            Button(action: {
                //
            }) {
                Circle()
                    .fill(lightWhiteButtonColor)
                    .frame(width: 80)
                    .overlay {
                        Image(systemName: "plus.forwardslash.minus")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.black)
                    }
            }
            .padding(.horizontal, 3)
            
            Button(action: {
                //
            }) {
                Circle()
                    .fill(lightWhiteButtonColor)
                    .frame(width: 80)
                    .overlay {
                        Text("%")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.black)
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
                        Image(systemName: "divide")
                            .font(.system(size: 28).bold())
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 3)
        }
    }
}

#Preview {
    FirstRowView(lightWhiteButtonColor: Color.white, creamOrangeButtonColor: Color.orange, calculationText: .constant(""), darkModeOn: .constant(true))
}

//
//  CustomStepper.swift
//  SparTestApp
//
//  Created by Александр Минк on 08.08.2024.
//

import SwiftUI

struct CustomStepper: View {
    
    private enum Locals {
        static let backgroundColor: Color = Color(red: 22/255, green: 183/255, blue: 66/255)
    }
    
    @Binding var count: Float
    
    var body: some View {
        HStack {
            Button {
                if count >= 0.1 {
                    count -= 0.1
                }
            } label: {
                Image(systemName: "minus")
                    .frame(minWidth: 36, minHeight: 36)
                    .background(Locals.backgroundColor)
            }
            .foregroundColor(.white)
            .background(Locals.backgroundColor)
            .bold()
            Spacer()
            VStack(spacing: 0) {
                Text("\(String(format: "%.1f", count)) кг")
                    .font(.custom("CeraRoundPro-Bold", size: 16))
                Text("~5,92 ₽")
                    .font(.system(size: 12))
            }
            .colorInvert()
            Spacer()
            Button {
                count += 0.1
            } label: {
                Image(systemName: "plus")
                    .frame(minWidth: 36, minHeight: 36)
                    .background(Locals.backgroundColor)
            }
            .foregroundColor(.white)
            .background(Locals.backgroundColor)
            .bold()
        }
        .foregroundColor(.black)
        .padding(10)
        .frame(height: 36)
        .background(Locals.backgroundColor)
        .cornerRadius(40)
        .font(.system(size: 18))
    }
}

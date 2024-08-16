//
//  CategoryGridCell.swift
//  SparTestApp
//
//  Created by Александр Минк on 09.08.2024.
//

import SwiftUI

struct CategoryGridCell: View {
    
    private var name: String
    private var image: String
    private var saleTag: String?
    private var saleTagColor: Color?
    private var star: Float
    private var price: Float
    private var salePrice: Float?
    private var isWeight: Bool = false
    @State private var weightCount: Float
    
    @State private var stepperSelectedState = "Шт"
    let states = ["Шт", "Кг"]
    
    init(_ product: Product) {
        self.name = product.name
        self.image = product.image
        self.saleTag = product.saleTag.description
        self.saleTagColor = product.saleTag.color
        self.star = product.star
        self.price = product.price
        self.salePrice = product.salePrice
        self.weightCount = product.weightCount ?? 0.0
        if product.weightCount != nil {
            self.isWeight = true
        }
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            ZStack {
                Image(image)
                    .frame(width: 168, height: 168)
                    .overlay(alignment: .topLeading) {
                        if let saleTag = saleTag {
                            Text(saleTag)
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                                .padding(.trailing, 6)
                                .padding([.top, .bottom], 4)
                                .background(saleTagColor)
                                .cornerRadius(10, corners: [.topLeft, .topRight, .bottomRight])
                        }
                }
                HStack(spacing: 0) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 12))
                    Text(String(format: "%.1f", star))
                        .font(.system(size: 12))
                }
                .padding(4)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                VStack(spacing: 0) {
                    Image("Bill")
                        .frame(width: 32, height: 32)
                    Image("Heart")
                        .frame(width: 32, height: 32)
                }
                .background(.white.opacity(0.7))
                .cornerRadius(16)
                .offset(x: 64, y: -48)
            }
            VStack {
                Text(name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 8)
                    .font(.system(size: 12))
                Spacer()
                
                if !isWeight {
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(alignment: .top, spacing: 2) {
                                if let salePrice = salePrice {
                                    Text("\(Int(salePrice))")
                                        .font(.custom("CeraRoundPro-Bold", size: 20))
                                    Text("\(Int(salePrice.truncatingRemainder(dividingBy: 1) * 100))")
                                        .font(.custom("CeraRoundPro-Bold", size: 16))
                                } else {
                                    Text("\(Int(price))")
                                        .font(.custom("CeraRoundPro-Bold", size: 20))
                                    Text("\(Int(price.truncatingRemainder(dividingBy: 1) * 100))")
                                        .font(.custom("CeraRoundPro-Bold", size: 16))
                                }
                                Image("PerAmountIcon")
                            }
                            if let _ = salePrice {
                                Text(String(format: "%.2f", price))
                                    .font(.system(size: 12))
                                    .strikethrough()
                            }
                        }
                        Spacer()
                        Image("Basket")
                            .foregroundColor(.white)
                            .frame(width: 48, height: 36)
                            .background(Color(red: 21/255, green: 183/255, blue: 66/255))
                            .cornerRadius(40)
                    }
                    .padding(.leading, 8)
                    .padding([.trailing, .bottom], 4)
                } else {
                    Picker("Appearance", selection: $stepperSelectedState) {
                        ForEach(states, id: \.self) {
                            Text($0)
                                .font(.system(size: 14))
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 4)
                    CustomStepper(count: $weightCount)
                        .padding(.horizontal, 4)
                        .padding(.bottom, 4)
                }
            }
        }
        .background(.white)
        .frame(width: 168, height: 278)
        .cornerRadius(16, corners: [.topLeft, .topRight])
        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
        .shadow(color: Color(red: 139/255, green: 139/255, blue: 139/255, opacity: 0.2), radius: 8)
    }
}

struct CategoryGridCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridCell(Product(id: 12345, name: "sdfghjk", price: 66.80, salePrice: 99.90, salePercent: nil, weight: 9999.99, count: nil, weightCount: 0.0, weightPerPrice: nil, description: nil, country: nil, star: 4.2, reviews: nil, saleTag: .new, image: "ImageMeat", inShoppingList: false, isFavorite: false))
    }
}

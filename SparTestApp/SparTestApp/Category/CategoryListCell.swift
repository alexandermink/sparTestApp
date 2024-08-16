//
//  CategoryListCell.swift
//  SparTestApp
//
//  Created by Александр Минк on 08.08.2024.
//

import SwiftUI

struct CategoryListCell: View {
    
    private var name: String
    private var image: String
    private var saleTag: String?
    private var saleTagColor: Color?
    private var star: Float
    private var price: Float
    private var salePrice: Float?
    private var salePercent: Int?
    private var reviews: [Review]?
    private var isWeight: Bool = false
    @State private var weightCount: Float
    
    @State private var stepperSelectedState = "Шт"
    private let states = ["Шт", "Кг"]
    
    init(_ product: Product) {
        self.name = product.name
        self.image = product.image
        self.saleTag = product.saleTag.description
        self.saleTagColor = product.saleTag.color
        self.star = product.star
        self.price = product.price
        self.salePrice = product.salePrice
        self.salePercent = product.salePercent
        self.reviews = product.reviews
        self.weightCount = product.weightCount ?? 0.0
        if product.weightCount != nil {
            self.isWeight = true
        }
    }
    
    var body: some View {
        VStack {
            Divider()
            HStack(spacing: 8) {
                ZStack(alignment: .bottomTrailing) {
                    Image(image)
                        .resizable()
                        .scaledToFill()
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
                        .cornerRadius(8)
                    if let salePercent = salePercent {
                        Text("\(salePercent)%")
                            .font(.custom("CeraRoundPro-Bold", size: 16))
                            .foregroundColor(Color(red: 195/255, green: 35/255, blue: 35/255))
                            .bold()
                            .padding(5)
                    }
                }
                .frame(width: 144, height: 144)
                VStack(alignment: .center, spacing: 0) {
                    
                    HStack(alignment: .center) {
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 0) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 12))
                                Text(String(format: "%.1f", star))
                                    .font(.system(size: 12))
                                Text("|")
                                    .padding(.horizontal, 4)
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                if let reviews = reviews {
                                    Text("\(reviews.count) отзывов")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Text(name)
                                .font(.system(size: 12))
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding(.leading, 8)
                        .frame(maxWidth: .infinity)
                        Spacer(minLength: 8)
                        VStack(spacing: 0) {
                            Image("Bill")
                                .frame(width: 32, height: 32)
                            Image("Heart")
                                .frame(width: 32, height: 32)
                        }
                        .background(.white.opacity(0.1))
                        .cornerRadius(16)
                    }
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
                        .padding(4)
                        CustomStepper(count: $weightCount)
                            .padding(4)
                    }
                }
                .frame(height: 144)
            }
            .frame(maxWidth: .infinity, maxHeight: 176)
            .padding([.leading, .bottom], 16)
            .padding(.trailing, 8)
        }
    }
}

struct CategoryListCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListCell(Product(id: 12345, name: "sdfghjk", price: 66.80, salePrice: 99.90, salePercent: 25, weight: 9999.99, count: nil, weightCount: 0.0, weightPerPrice: nil, description: nil, country: nil, star: 4.2, reviews: [Review(id: 1, name: "dfghj"), Review(id: 2, name: "werty"), Review(id: 3, name: "cvbnm")], saleTag: .new, image: "ImageMeat", inShoppingList: false, isFavorite: false))
    }
}

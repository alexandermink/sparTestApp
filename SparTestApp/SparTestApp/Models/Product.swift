//
//  Product.swift
//  SparTestApp
//
//  Created by Александр Минк on 13.08.2024.
//

import SwiftUI

enum SaleTag: Codable {
    case empty
    case new
    case sale
    
    var description: String? {
        
        switch self {
        case .empty:
            return nil
        case .new:
            return "Новинка"
        case .sale:
            return "Удар по ценам"
        }
    }
    
    var color: Color? {
        switch self {
        case .empty:
            return nil
        case .new:
            return Color(red: 122/255, green: 121/255, blue: 186/255, opacity: 0.9)
        case .sale:
            return Color(red: 252/255, green: 106/255, blue: 111/255, opacity: 0.9)
        }
    }
}

struct Product: Identifiable, Codable {
    
    let id: Int
    let name: String
    let price: Float
    let salePrice: Float?
    let salePercent: Int?
    let weight: Float
    let count: Int?
    let weightCount: Float?
    let weightPerPrice: Float?
    let description: String?
    let country: String?
    let star: Float
    let reviews: [Review]?
    let saleTag: SaleTag
    let image: String
    // ....
    
    let inShoppingList: Bool
    let isFavorite: Bool
}

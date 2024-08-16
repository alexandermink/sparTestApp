//
//  ServiceProtocol.swift
//  SparTestApp
//
//  Created by Александр Минк on 13.08.2024.
//

import Foundation

protocol ServiceProtocol {
    
    // Product list
    func getProductsList() -> [Product]
    
    // Cart
    func getCart() -> Cart
    func numberOfCartItems() -> Int
    func addToCart(product: Product)
//    func removeFromCart(product: Product) -> Bool
//    func checkout()
    
}

//
//  CategoryProductService.swift
//  SparTestApp
//
//  Created by Александр Минк on 13.08.2024.
//

import Foundation

class CategoryProductService: ServiceProtocol {
    
    private let products: [Product] = [
        Product(id: 123,
                name: "сыр Ламбер 500/0 230г",
                price: 66.80,
                salePrice: 99.90,
                salePercent: 25,
                weight: 9999.99,
                count: nil,
                weightCount: 0.0,
                weightPerPrice: nil,
                description: nil,
                country: nil,
                star: 4.2,
                reviews: [
                    Review(id: 1, name: "dfghj"),
                    Review(id: 2, name: "werty"),
                    Review(id: 3, name: "cvbnm")
                ],
                saleTag: .new,
                image: "ImageMeat",
                inShoppingList: false,
                isFavorite: false),
        
        Product(id: 234, name: "Энергетический Напит", price: 190.90, salePrice: nil, salePercent: nil, weight: 9999.99, count: nil, weightCount: nil, weightPerPrice: nil, description: nil, country: nil, star: 3.5, reviews: [Review(id: 4, name: "dfghj"), Review(id: 5, name: "werty"), Review(id: 6, name: "cvbnm")], saleTag: .empty, image: "Image", inShoppingList: false, isFavorite: false),
        Product(id: 345, name: "Салат Овощной с Крабовыми Палочками", price: 150, salePrice: nil, salePercent: 40, weight: 9999.99, count: nil, weightCount: nil, weightPerPrice: nil, description: nil, country: nil, star: 4.2, reviews: [Review(id: 7, name: "dfghj"), Review(id: 8, name: "werty"), Review(id: 9, name: "cvbnm")], saleTag: .sale, image: "ImageMeat", inShoppingList: false, isFavorite: false),
        Product(id: 456, name: "Дорадо Охлажденная Непотрошеная 300-400г", price: 155.77, salePrice: 120.20, salePercent: 15, weight: 9999.99, count: nil, weightCount: 0.0, weightPerPrice: nil, description: nil, country: nil, star: 5, reviews: nil, saleTag: .new, image: "ImageMeat", inShoppingList: false, isFavorite: false),
        Product(id: 67, name: "Ролл Маленькая Япония 216г", price: 144.44, salePrice: 190.55, salePercent: nil, weight: 9999.99, count: nil, weightCount: 0.0, weightPerPrice: nil, description: nil, country: nil, star: 2, reviews: [Review(id: 10, name: "dfghj"), Review(id: 11, name: "werty"), Review(id: 12, name: "cvbnm")], saleTag: .sale, image: "Image", inShoppingList: false, isFavorite: false),
        Product(id: 3456, name: "Огурцы тепличные cадово-огородные", price: 9924.24, salePrice: nil, salePercent: nil, weight: 9999.99, count: nil, weightCount: 0.0, weightPerPrice: nil, description: nil, country: nil, star: 3.7, reviews: nil, saleTag: .empty, image: "ImageMeat", inShoppingList: false, isFavorite: false)
    ]
    
    private var cart: Cart = Cart(products: [], totalPrice: 0)
    
    func getProductsList() -> [Product] {
        // TODO: Запрос с сервера urlService.getProducts ...
        products
    }
    
    func getCart() -> Cart {
        cart
    }
    
    func numberOfCartItems() -> Int {
        cart.products.count
    }
    
    func addToCart(product: Product) {
        cart.products.append(product)
    }
    
//    func removeFromCart(product: Product) -> Bool {
//        cart.products.remove(at: product.id)
//    }
}

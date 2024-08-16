//
//  CategoryViewModel.swift
//  SparTestApp
//
//  Created by Александр Минк on 13.08.2024.
//

import Foundation

class CategoryViewModel: ViewModel {
    
    @Published var state: CategoryState
    
    init() {
        let service = CategoryProductService()
        let products = CategoryProductService().getProductsList()
        self.state = CategoryState(service: service, products: products)
    }
    
    func trigger(_ input: Never) { }
}

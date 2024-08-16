//
//  CategoryList.swift
//  SparTestApp
//
//  Created by Александр Минк on 08.08.2024.
//

import SwiftUI

struct CategoryList: View {
    
    @ObservedObject var viewModel: CategoryViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.state.products) { product in
                
                CategoryListCell(product)
                    .frame(maxWidth: .infinity)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .buttonStyle(.plain)
            }
        }
        .frame(maxWidth: .infinity)
        .listStyle(.plain)
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList(viewModel: CategoryViewModel())
    }
}

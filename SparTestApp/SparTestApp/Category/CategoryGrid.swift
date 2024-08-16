//
//  CategoryGrid.swift
//  SparTestApp
//
//  Created by Александр Минк on 09.08.2024.
//

import SwiftUI

struct CategoryGrid: View {
    
    @ObservedObject var viewModel: CategoryViewModel
    
    private let gridColumns = [GridItem(.fixed(168), spacing: 8, alignment: .leading),
                              GridItem(.fixed(168), spacing: 8, alignment: .leading)]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Divider()
            LazyVGrid(columns: gridColumns) {
                ForEach(viewModel.state.products) { product in
                    CategoryGridCell(product)
                        .buttonStyle(.plain)
                }
            }
        }
    }
}

struct CategoryGrid_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGrid(viewModel: CategoryViewModel())
    }
}

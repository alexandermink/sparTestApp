//
//  Category.swift
//  SparTestApp
//
//  Created by Александр Минк on 10.08.2024.
//

import SwiftUI

struct CategoryState {
    var service: CategoryProductService
    var products: [Product]
}

struct Category: View {
    
    @ObservedObject var viewModel: CategoryViewModel
    
    @State private var listState: Bool = false
    
    public func toolbarContent() -> some ToolbarContent {
        
        ToolbarItem(placement: .navigationBarLeading) {
            HStack(alignment: .top) {
                Button {
                    listState.toggle()
                } label: {
                    if listState {
                        Image("ListButton")
                    } else {
                        Image("GridButton")
                    }
                }
            }
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                if listState {
                    CategoryList(viewModel: viewModel)
                        .toolbar {
                            toolbarContent()
                        }
                } else {
                    CategoryGrid(viewModel: viewModel)
                        .toolbar {
                            toolbarContent()
                        }
                }
            }
        }
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        Category(viewModel: CategoryViewModel())
    }
}

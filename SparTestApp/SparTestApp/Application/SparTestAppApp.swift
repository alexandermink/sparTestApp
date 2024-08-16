//
//  SparTestAppApp.swift
//  SparTestApp
//
//  Created by Александр Минк on 06.08.2024.
//

import SwiftUI

@main
struct SparTestAppApp: App {
    var body: some Scene {
        WindowGroup {
            Category(viewModel: CategoryViewModel())
        }
    }
}

//
//  LT_MusicApp.swift
//  LT_Music
//
//  Created by NlaboStaff on 2024/01/19.
//

import SwiftUI

@main
struct LT_MusicApp: App {
    var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}


//
//  Surprise_me_SwiftUIApp.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 11/06/2024.
//

import SwiftUI
import Firebase

@main
struct Surprise_me_SwiftUIApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
                SplashScreenView()
                    .environmentObject(viewModel)
        }
    }
}

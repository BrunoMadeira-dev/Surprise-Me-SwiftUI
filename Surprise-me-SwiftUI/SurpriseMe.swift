//
//  ContentView.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 11/06/2024.
//

import SwiftUI

struct SurpriseMe: View {
    
    //@State private var isLoginPressed = false
    @State private var isSigninPressed = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                MainTabView()
            }
            
        }
    }
}

#Preview {
    SurpriseMe()
}


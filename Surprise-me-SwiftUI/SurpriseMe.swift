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
        VStack {
            Spacer()
            Image("surprise-me-logo")
                .resizable()
                .scaledToFit()
            Spacer()
            NavigationLink {
                LoginView()
                    .toolbar(.hidden)
            } label: {
                SMButton(title: "Log In")
            }
            Button {
                    isSigninPressed.toggle()
            } label: {
                SMButton(title: "Sign In")
            }
            if isSigninPressed {
                RegisterView()
            }

            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SurpriseMe()
}


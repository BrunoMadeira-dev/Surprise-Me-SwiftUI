//
//  SplashScreenView.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 11/06/2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            withAnimation(.easeInOut(duration: 0.8)) {
                SurpriseMe()
            }
        } else {
            VStack {
                VStack {
                    Image("surprise-me-logo")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(Color("lightBlueColor"))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}

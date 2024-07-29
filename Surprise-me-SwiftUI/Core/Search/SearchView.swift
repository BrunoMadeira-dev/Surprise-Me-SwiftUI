//
//  SearchView.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 21/06/2024.
//

import SwiftUI

struct SearchView: View {
    
    @State var headerHeight: CGFloat = 230
    
    var body: some View {
        VStack {
            VStack {
                HStack { Spacer() }
                Image("surprise-me-white-transparent")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 70)
                    .padding(.bottom, 15)
            }
            .background(Color("lightBlueColor"))
            .frame(height: headerHeight)
            .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
            
            Button(action: {
                
                withAnimation {
                    headerHeight = headerHeight == 230 ? 150 : 230
                }
                
            }, label: {
                SMButton(title: "Try Me")
            })
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SearchView()
}

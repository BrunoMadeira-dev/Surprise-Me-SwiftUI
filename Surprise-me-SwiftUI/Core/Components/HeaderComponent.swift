//
//  HeaderComponent.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 21/06/2024.
//

import SwiftUI

struct HeaderComponent: View {
    var title1: String
    var title2: String
    var body: some View {
        VStack(alignment: .center) {
            HStack { Spacer() }
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 230)
        .background(Color("lightBlueColor"))
        .foregroundStyle(.white)
        .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
    }
}

#Preview {
    HeaderComponent(title1: "Hello", title2: "Welcome Back")
}

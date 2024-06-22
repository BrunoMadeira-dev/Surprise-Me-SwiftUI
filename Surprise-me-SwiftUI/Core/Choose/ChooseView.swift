//
//  ChooseView.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 21/06/2024.
//

import SwiftUI

struct ChooseView: View {
    var body: some View {
        VStack {
            Image(systemName: "restart.circle.fill")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ChooseView()
}

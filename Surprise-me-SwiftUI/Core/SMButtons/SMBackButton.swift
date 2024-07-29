//
//  SMBackButton.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 26/07/2024.
//

import SwiftUI

struct SMBackButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "chevron.left")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    SMBackButton()
}

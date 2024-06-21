//
//  SMButton.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 12/06/2024.
//

import SwiftUI

struct SMButton: View {
    var title: String
    var body: some View {
        Text(title)
            .foregroundStyle(.white)
            .frame(width: 300, height: 45)
            .background(Color("lightBlueColor"))
            .clipShape(.buttonBorder)
            .padding(.top)
            .shadow(color: Color(.darkGray), radius: 10, x: 10, y: 15)
    }
}

#Preview {
    SMButton(title: "Teste")
}

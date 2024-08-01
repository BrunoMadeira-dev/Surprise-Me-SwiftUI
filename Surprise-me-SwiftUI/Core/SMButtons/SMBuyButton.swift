//
//  SMBuyButton.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 31/07/2024.
//

import SwiftUI

struct SMBuyButton: View {
    var body: some View {
        Image(systemName: "plus")
            .frame(width: 30, height: 15)
            .padding()
            .foregroundStyle(.black)
            .background(Color("lightBlueColor"))
            .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    SMBuyButton()
}

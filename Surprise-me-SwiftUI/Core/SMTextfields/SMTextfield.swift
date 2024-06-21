//
//  SMTextfield.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 12/06/2024.
//

import SwiftUI

struct SMTextfield: View {
    var placeholder: String
    var body: some View {
        TextField(placeholder, text: .constant(""))
            .frame(width: 300, height: 45)
            .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    SMTextfield(placeholder: "Teste")
}

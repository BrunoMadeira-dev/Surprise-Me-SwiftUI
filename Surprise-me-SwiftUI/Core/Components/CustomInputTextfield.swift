//
//  CustomInputTextfield.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 21/06/2024.
//

import SwiftUI

struct CustomInputTextfield: View {
    
    
    let imageName: String
    let placeholder: String
    var isSecureField: Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color(.darkGray))
                if isSecureField ?? false {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}

#Preview {
    CustomInputTextfield(imageName: "envelope",
                         placeholder: "Email",
                         isSecureField: false,
                         text: .constant(""))
}

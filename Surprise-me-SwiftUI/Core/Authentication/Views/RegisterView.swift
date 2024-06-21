//
//  RegisterView.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 21/06/2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        VStack {
            HeaderComponent(title1: "Setup Account", title2: "Enter Your Details")
            
            VStack(spacing: 44) {
                CustomInputTextfield(imageName: "person",
                                     placeholder: "Full Name",
                                     text: $fullname)
                CustomInputTextfield(imageName: "person",
                                     placeholder: "User Name",
                                     text: $username)
                CustomInputTextfield(imageName: "envelope",
                                     placeholder: "Email",
                                     text: $email)
                CustomInputTextfield(imageName: "lock",
                                     placeholder: "Password",
                                     text: $password)
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 40)
            
            Button(action: {
                print()
            }, label: {
                SMButton(title: "Sign Up")
            })
            
            Spacer()
            
            NavigationLink {
                LoginView()
                    .toolbar(.hidden)
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color("lightBlueColor"))
                    Text("Sign In")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("lightBlueColor"))
                }
                .padding(.bottom, 40)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    RegisterView()
}

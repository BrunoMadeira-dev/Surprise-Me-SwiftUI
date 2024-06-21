//
//  LoginView.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 21/06/2024.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack {
            HeaderComponent(title1: "Hello!", title2: "Welcome Back!")
            VStack(spacing: 40) {
                CustomInputTextfield(imageName: "envelope",
                                     placeholder: "Email",
                                     text: $email)
                CustomInputTextfield(imageName: "lock", placeholder: "Password", text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 44)
            
            HStack {
                Spacer()
                NavigationLink {
                    
                } label: {
                    Text("Forgot password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color("lightBlueColor"))
                        .padding(.trailing, 35)
                }
            }
            
            Button(action: {
                print("Call the function to login the user!")
            }, label: {
                SMButton(title: "Sign In")
            })
            
            Spacer()
            
            NavigationLink {
                RegisterView()
                    .toolbar(.hidden)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color("lightBlueColor"))
                    Text("Sign Up")
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
    LoginView()
}

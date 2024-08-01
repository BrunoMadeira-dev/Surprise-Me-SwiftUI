//
//  LoginView.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 21/06/2024.
//

import SwiftUI

struct LoginView: View {
    
    private enum Field: Int, CaseIterable {
            case username, password
    }
    @FocusState private var focusedField: Field?
    
    @State var email = ""
    @State var password = ""
    @State private var isLoggedIn = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderComponent(title1: "Hello!", title2: "Welcome Back!")
                VStack(spacing: 40) {
                    CustomInputTextfield(imageName: "envelope",
                                         placeholder: "Email",
                                         text: $email)
                    CustomInputTextfield(imageName: "lock",
                                         placeholder: "Password",
                                         isSecureField: true,
                                         text: $password)
                }
                .focused($focusedField, equals: .username)
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        Button(action: {
                            focusedField = nil
                        }, label: {
                            Text("Done")
                        })
                    }
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
                            .padding(.bottom, 10)
                    }
                }
                
                Button(action: {
                    viewModel.loginUser(withEmail: email,
                                        password: password)

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
}

#Preview {
    LoginView()
}

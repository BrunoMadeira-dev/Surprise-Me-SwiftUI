//
//  RegisterView.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 21/06/2024.
//

import SwiftUI

struct RegisterView: View {
    
    private enum Field: Int, CaseIterable {
            case username, password
    }
    @FocusState private var focusedField: Field?
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var password = ""
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var isRegistered = false  // Flag para controle de navegação
    
    var body: some View {
        VStack {
            HeaderComponent(title1: "Setup Account", title2: "Enter Your Details")
            
            NavigationStack {
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
                .focused($focusedField, equals: .username)
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button(action: {
                            focusedField = nil
                        }, label: {
                            Text("Done")
                            
                        })
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                .padding(.vertical, 40)
                .padding(.horizontal, 40)
                
                Button(action: {
                    viewModel.createUser(withEmail: email,
                                         password: password,
                                         fullname: fullname,
                                         username: username)
                    isRegistered.toggle()
                }, label: {
                    SMButton(title: "Sign Up")
                })
            }
            .navigationDestination(isPresented: $isRegistered) {
                MainTabView()
                    .toolbar(.hidden)
            }
            Spacer()
            
            Button {
                dismiss.callAsFunction()
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

//
//  ProfileView.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 21/06/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var date = Date()
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Form {
                Text("Teste")
                DatePicker("Birthday date", selection: $date, displayedComponents: .date)
                
                Button {
                    //viewModel.logOut()
                } label: {
                    Text("Logout")
                        .foregroundStyle(.red)

                }
                .onTapGesture {
                    viewModel.logOut()
                }
            }
        }

    }
}

#Preview {
    ProfileView()
}

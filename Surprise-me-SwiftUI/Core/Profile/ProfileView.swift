//
//  ProfileView.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 21/06/2024.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @State private var date = Date()
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 50)
                .foregroundStyle(Color(.systemGray3))
            
            Form {
                Text("Teste")
                DatePicker("Birthday date", selection: $date, displayedComponents: .date)
                
                Button {
                    viewModel.logOut()
                } label: {
                    Text("Logout")
                        .foregroundStyle(.red)
                }
                .onTapGesture {
                    viewModel.logOut()
                }
            }
            
            Text("© Bruno Madeira")
        }
        .background(Color(.systemGray6))

    }
}

#Preview {
    ProfileView()
}

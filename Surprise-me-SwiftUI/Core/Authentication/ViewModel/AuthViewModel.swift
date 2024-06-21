//
//  AuthViewModel.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 21/06/2024.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: Firebase.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
}

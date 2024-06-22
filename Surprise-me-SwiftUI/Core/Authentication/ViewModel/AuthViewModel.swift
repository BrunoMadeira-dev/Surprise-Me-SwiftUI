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
        print("DEBUG: Initialized correctly! user is: \n\(userSession?.uid ?? "Does not have one yet!")")
    }
    
    func loginUser(withEmail email: String, password: String) {
        print("DEBUG: Tried to login user session is: \(userSession?.uid ?? "Not created yet")")
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: There was an error loggin in the user. \nThe error was: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
        
    }
    
    func createUser(withEmail email: String, password: String, fullname: String, username: String) {
        print("DEBUG: Tried to login user session is: \(userSession?.uid ?? "Not created yet")")
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: There was an error creating the user. \nThe error was: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            
            self.userSession = user
            
            print("DEBUG: User created correctly")
            print("DEGUG: UserSession uid is: \n\(self.userSession?.uid)")
        }
    }
    
    func logOut() {
        userSession = nil
        try? Auth.auth().signOut()
        
        print("DEBUG: User logged out successfully!")
    }
}

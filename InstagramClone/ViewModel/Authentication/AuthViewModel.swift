//
//  AuthViewModel.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 11/3/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    init(){
        userSession = Auth.auth().currentUser
    }
    
    func login(){
        print("Login")
    }
    
    func register(withEmail email: String, password: String){
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else{ return }
            self.userSession = user
            
            print("Succsessfully registered user")
        }
        
        print("Register")
        print(email)
        print(password)
    }
    
    func signout(){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword(){
        
    }
    
    func fetchUser(){
        
    }
    
}


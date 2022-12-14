//
//  User.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 11/16/22.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable{
    let username: String
    let email: String
    let profileImageURL: String
    let fullname: String
    
    @DocumentID var id: String?
    
    var isFollowed: Bool? = false
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id}
}

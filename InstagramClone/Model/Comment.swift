//
//  Comment.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 3/7/23.
//

import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable{
    
    @DocumentID var id: String?
    let username: String
    let postOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
    
}

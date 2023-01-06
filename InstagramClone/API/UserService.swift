//
//  UserService.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 11/22/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseStorage

typealias FirestoreCompletion = ((Error?) -> Void)?

struct UserService {
    
    static func follow(uid: String, completion: ((Error?) -> Void)? ){
        //get current user id
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        //update a users following collection
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
            .document(uid).setData([:]) { error in
                if let error = error{
                    print("ERROR: Userservice func follow - \(error.localizedDescription)")
                }
                //updating the followers collection
                COLLECTION_FOLLOWERS.document(uid).collection("user-followers")
                    .document(currentUid).setData([:], completion: completion)
            }
    }
    
    static func unfollow(uid: String, completion: ((Error?) -> Void)? ){
        //get current user id
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
            .document(uid).delete { _ in
                COLLECTION_FOLLOWERS.document(uid).collection("user-followers")
                    .document(currentUid).delete(completion: completion)
            }
        
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool) -> Void){
        //get current user id
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
            .document(uid).getDocument { snapshot, error in
                if let error = error{
                    print("ERROR: Userservice func checkIfUserIsFollowed - \(error.localizedDescription)")
                }
                
                guard let isFollowed = snapshot?.exists else { return }
                completion(isFollowed)
            }
    }
}

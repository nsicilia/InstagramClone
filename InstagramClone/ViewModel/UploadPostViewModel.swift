//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 12/4/22.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    
    func uploadPost(caption: String, image: UIImage, completion: FirestoreCompletion){
        //get info about current user
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data = ["caption":caption,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageUrl": imageUrl,
                        "ownerUid": user.id ?? "",
                        "ownerImageUrl": user.profileImageURL,
                        "ownerUsername": user.username] as [String: Any]
            
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
            
//            COLLECTION_POSTS.addDocument(data: data) { error in
//                //Handle error
//                if let error = error{
//                    print("DEBUG: UploadPostViewModel failed - \(error.localizedDescription)")
//                    return
//                }
//
//                print("DEBUG: Post Uploaded")
//
//            }
        }
    }
}

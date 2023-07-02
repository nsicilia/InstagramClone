//
//  FeedCellViewModel.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 2/21/23.
//

import SwiftUI

class FeedCellViewModel: ObservableObject{
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
    }
    
    var likeString: String {
        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    
    func like(){
        // Check if there is a user currently signed in. If not, return and do nothing.
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        // Get the ID of the post that is being liked.
        guard let postId = post.id else {return}
        
        // Access the "post-likes" subcollection of the post's document in the "COLLECTION_POSTS" collection.
        // Then, create a new document with the user's ID as the document ID, and an empty dictionary as the data.
        COLLECTION_POSTS.document(postId).collection("post-likes")
            .document(uid).setData([:]) { _ in
                
                // Access the "user-likes" subcollection of the user's document in the "COLLECTION_USERS" collection.
                // Then, create a new document with the post's ID as the document ID, and an empty dictionary as the data.
                COLLECTION_USERS.document(uid).collection("user-likes")
                    .document(postId).setData([:]) { _ in
                        
                        //In the firebase db add 1 to the like count
                        COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1])
                        
                        NotificationsViewModel.uploadNotification(toUid: self.post.ownerUid, type: .like, post: self.post)
                        
                        // Update the post's "didLike" property to true, indicating that the user has liked the post.
                        self.post.didLike = true
                        //increment likes
                        self.post.likes += 1
                    }
            }
    }

    
    func unlike(){
        guard post.likes > 0 else {return}
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        guard let postId = post.id else {return}
        
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).delete { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).delete { _ in
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1])
                
                self.post.didLike = false
                self.post.likes -= 1
            }
        }
        
        
    }
    
    func checkIfUserLikedPost(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        guard let postId = post.id else {return}
        
        COLLECTION_USERS.document(uid).collection("user-likes").document(postId).getDocument { snapshot, _ in
            guard let didlike = snapshot?.exists else {return}
            self.post.didLike = didlike
        }
        
    }
}

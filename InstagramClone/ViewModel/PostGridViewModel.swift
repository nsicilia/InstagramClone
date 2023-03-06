//
//  PostGridViewModel.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 1/13/23.
//

import SwiftUI


enum PostGridConfiguration{
    case explore
    case profile(String)
}


class PostGridViewModel: ObservableObject{
    @Published var posts = [Post]()
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        fetchPosts(forConfig: config)
    }
    
    
    func fetchPosts(forConfig config: PostGridConfiguration){
        switch config {
        case .explore:
            fetchExplorePosts()
            
        case .profile(let uid):
            fetchUserPosts(forUid: uid)
        }
    }
    
    
    func fetchExplorePosts(){
        // retrieve documents from COLLECTION_POSTS collection
        COLLECTION_POSTS.getDocuments { SnapshotData, error in
            //Handle error
            if let error = error{print("ERROR: SearchViewModel - \(error.localizedDescription)"); return }
            // check if SnapshotData contains any documents
            guard let documents = SnapshotData?.documents else {return}
            // map the documents to Post objects using the data(as:) method and assign the result to the posts property
            self.posts = documents.compactMap({try? $0.data(as: Post.self)})
        }
    }
    
    
    func fetchUserPosts(forUid uid: String){
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { SnapshotData, error in
            //Handle error
            if let error = error{print("ERROR: SearchViewModel - \(error.localizedDescription)"); return }
            // check if SnapshotData contains any documents
            guard let documents = SnapshotData?.documents else {return}
            // map the documents to Post objects using the data(as:) method and assign the result to the posts property
            self.posts = documents.compactMap({try? $0.data(as: Post.self)})
        }
        
    }
}

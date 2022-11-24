//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 11/22/22.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User){
        self.user = user
        checkIfUserIsFollowed()
    }
    
    
    func follow(){
        guard let uid = user.id else { return }
        
        UserService.follow(uid: uid) { error in
            
            if let error = error{
                print("ERROR: class ProfileViewModel func follow - \(error.localizedDescription)")
            }
            
            self.user.isFollowed = true
        }
    }
    
    func unfollow(){
        guard let uid = user.id else { return }
        
        UserService.unfollow(uid: uid) { error in
            
            if let error = error{
                print("ERROR: class ProfileViewModel func unfollow - \(error.localizedDescription)")
            }
            
            self.user.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed(){
        guard !user.isCurrentUser else { return }
        guard let uid = user.id else { return }
        UserService.checkIfUserIsFollowed(uid: uid) { isFollowd in
            self.user.isFollowed = isFollowd
        }
        
    }
}

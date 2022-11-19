//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 11/18/22.
//

import SwiftUI


class SearchViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    
//      what auto-populated
//    init(users: [User] = [User]()) {
//        self.users = users
//    }
    
    
    func fetchUsers(){
        
        COLLECTION_USERS.getDocuments { snapshot, error in
            if let error = error{
                print("ERROR: SearchViewModel - \(error.localizedDescription)")
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            
//            documents.forEach { QueryDocumentSnapshot in
//                guard let user = try? QueryDocumentSnapshot.data(as: User.self) else { return }
//                self.users.append(user)
//            }
            
            self.users = documents.compactMap { try? $0.data(as: User.self) }
            
            print(self.users)
        }
        
    }
}

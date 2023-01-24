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
    
    
    func fetchUsers(){
        
        COLLECTION_USERS.getDocuments { snapshot, error in
            //handle error
            if let error = error{print("ERROR: SearchViewModel - \(error.localizedDescription)"); return }
            
            guard let documents = snapshot?.documents else { return }
//            documents.forEach { QueryDocumentSnapshot in
//                guard let user = try? QueryDocumentSnapshot.data(as: User.self) else { return }
//                self.users.append(user)
//            }
            //Shortform of the forEach
            self.users = documents.compactMap { try? $0.data(as: User.self) }
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.lowercased().contains(lowercasedQuery) })
    }
}

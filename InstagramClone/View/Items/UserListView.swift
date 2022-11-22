//
//  UserListView.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 8/28/22.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(users) { user in
                    
                    NavigationLink {
                        ProfileView(user: user)
                    } label: {
                        UserCell(user: user)
                            .padding(.leading)
                    }

                    
                }
            }
        }
    }
}

//struct UserListView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        UserListView()
//    }
//}

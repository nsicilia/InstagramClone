//
//  UserListView.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 8/28/22.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(viewModel.users) { user in
                    
                    NavigationLink {
                        ProfileView()
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

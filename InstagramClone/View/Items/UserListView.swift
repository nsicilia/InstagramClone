//
//  UserListView.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 8/28/22.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(0 ..< 20) { _ in
                    
                    NavigationLink {
                        ProfileView()
                    } label: {
                        UserCell()
                            .padding(.leading)
                    }

                    
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}

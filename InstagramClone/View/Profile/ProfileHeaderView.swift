//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 9/5/22.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading){
            
            //Image
            HStack {
                KFImage(URL(string: user.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 8){
                //Stats
                UserStatView(value: 15, title: "Posts")
                UserStatView(value: 34, title: "Followers")
                UserStatView(value: 64, title: "Following")
                }
                .padding(.trailing, 16)
            }
            //name
            Text(user.fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading,.top])
            
            //description
            Text("OH ✈️ NY ✈️ CA   |   ASU '19   |   fashion, travel & lifestyle")
                .font(.system(size: 15))
                .padding([.leading, .trailing])
                .padding(.top, 1)
            
            
            HStack {
                Spacer()
                
                //Buttons
                ProfileActionButtonView(isCurrentUser: user.isCurrentUser)
                
                Spacer()
            }
            .padding(.top)

        }
    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User(username: "name", email: "email@email.com", profileImageURL: "https://firebasestorage.googleapis.com:443/v0/b/instagramclone-256b6.appspot.com/o/profile_images%2F16B6A869-E2CE-4138-8D1C-7D8DA9C9A5E2?alt=media&token=5cf97352-08b8-4698-b71d-31b390a52b52", fullname: "Jane Doeinton"))
    }
}

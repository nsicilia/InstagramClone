//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 9/5/22.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading){
            
            //Image
            HStack {
                Image("jessica")
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
            Text("Jessica Johnson")
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
                ProfileActionButtonView()
                
                Spacer()
            }
            .padding(.top)

        }
    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}

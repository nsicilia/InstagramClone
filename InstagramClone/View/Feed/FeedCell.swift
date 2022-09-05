//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 8/20/22.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        //user info
        VStack(alignment: .leading) {
            HStack{
                Image("jessica")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                Text("Jessica")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading, .bottom],8)
        
        
        //post image
            Image("jessica")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
        //action buttons
            HStack(spacing: 16){
                //like
                Button(action: {}, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                //comment
                Button(action: {}, label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                //share
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
            }
            .padding(.leading, 4)
            .foregroundColor(.black)
        
        //caption and like count
            Text("3 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack{

                Text("Jessica ")
                    .font(.system(size: 14, weight: .semibold))
                +
                Text("Lorem Ipsum has been a common industry's standard dummy text ever since the 1500s.")
                    .font(.system(size: 15))
            }
            .padding(.horizontal, 8)
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top,-2)
            
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}

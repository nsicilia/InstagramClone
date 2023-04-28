//
//  CommentCell.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 3/7/23.
//

import SwiftUI
import Kingfisher

struct CommentCell: View {
    let comment: Comment
    
    var body: some View {
        HStack{
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text(comment.username).font(.system(size: 14 ,weight: .semibold)) +
            Text(" ").font(.system(size: 14 ,weight: .semibold)) +
            Text(comment.commentText).font(.system(size: 14))
            
            Spacer()
            
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }
        .padding(.horizontal)
    }
}

//struct CommentCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentCell(comment: Comment(username: "", postOwnerUid: "", profileImageUrl: <#T##String#>, commentText: "this is a comment", timestamp: <#T##Timestamp#>, uid: <#T##String#>))
//    }
//}

//
//  FeedCell.swift
//  InstagramClone
//r
//  Created by Nicholas Siciliano-Salazar  on 8/20/22.
//

import SwiftUI
import Firebase //just for preview
import Kingfisher

struct FeedCell: View {
    //let viewModel.post: Post
    
    @ObservedObject var viewModel: FeedCellViewModel
    
    var didLike: Bool {return viewModel.post.didLike ?? false}
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        //user info
        VStack(alignment: .leading) {
            HStack{
                KFImage(URL(string: viewModel.post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading, .bottom],8)
        
        
        //post image
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxWidth: UIScreen.screenWidth, maxHeight: 400)
                .clipped()
        //action buttons
            HStack(spacing: 16){
                //like
                Button(action: {
                    didLike ? viewModel.unlike() : viewModel.like()
                }, label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLike ? .red : .black)
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                //comment
                NavigationLink(destination: CommentsView(post: viewModel.post)) {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
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
            Text(viewModel.likeString)
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack{

                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
                +
                Text(" \(viewModel.post.caption)")
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
        FeedCell(viewModel: FeedCellViewModel(post: Post(ownerUid: "dd", ownerUsername: "jessica", caption: "Lorum Ipsum dolor", likes: 5, imageUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80", timestamp: Timestamp(), ownerImageUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")))
    }
}

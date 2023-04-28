//
//  CommentsView.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 3/7/23.
//

import SwiftUI
import Firebase

struct CommentsView: View {
    @State var commentText = ""
    
    @ObservedObject var viewModel: CommentViewModel
    
    init(post:Post){
        self.viewModel = CommentViewModel(post: post)
    }
    
    var body: some View {
        VStack{
            //Comments cells
            ScrollView{
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                    }
                }
            }
            .padding(.top)
            
            //Input
            CustomInputView(inputText: $commentText, action: uploadComment)
        }
    }
    
    func uploadComment(){
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(post: Post(ownerUid: "dd", ownerUsername: "jessica", caption: "Lorum Ipsum dolor", likes: 5, imageUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80", timestamp: Timestamp(), ownerImageUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"))
    }
}

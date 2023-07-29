//
//  NotificationCell.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 9/5/22.
//

import SwiftUI
import Kingfisher
import Firebase

struct NotificationCell: View {
    @State private var showPostImage = true
     @ObservedObject var viewModel: NotificationCellViewModel
    
    var isFollowed: Bool {return viewModel.notification.isFollowed ?? false }
    
    init(viewModel: NotificationCellViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            //Image
            if let user = viewModel.notification.user {
                NavigationLink {
                    ProfileView(user: user)
                } label: {
                    KFImage(URL(string: viewModel.notification.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                    //Name + Notifiaction
                    Text(viewModel.notification.username)
                        .font(.system(size: 14, weight: .semibold))
                    +
                    Text(viewModel.notification.type.notificationMessage)
                        .font(.system(size: 15))
                }

            }
            
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post{
                    NavigationLink {
                        FeedCell(viewModel: FeedCellViewModel(post: post))
                    } label: {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                    }

                }
            } else{
                Button {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(isFollowed ? "Following": "Follow")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 100, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? .white : .blue)
                        .cornerRadius(3)
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        }
                }
                
            }
        }
        .padding(.horizontal)
        
    }
}

struct NotificationCell_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        VStack{
            NotificationCell(viewModel: NotificationCellViewModel(notification: Notification(username: "weirdstatue", profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/instagramclone-256b6.appspot.com/o/profile_images%2FAA950D5C-38E0-46A0-A5B3-4FCAB21993DC?alt=media&token=f8172e03-de1c-4b7e-8f96-aa401b0b6d77", timestamp: Timestamp(), type: .follow, uid: "OlWrOF8N9YX43S2iuLiJUUKx7R32")))
            
        }
    }
}

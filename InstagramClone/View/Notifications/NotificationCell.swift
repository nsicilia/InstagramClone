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
    let notification: Notification
    
    var body: some View {
        HStack {
            //Image
            KFImage(URL(string: notification.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            //Name + Notifiaction
            Text(notification.username)
                .font(.system(size: 14, weight: .semibold))
            +
            Text(notification.type.notificationMessage)
                .font(.system(size: 15))
            
            Spacer()
            
            if notification.type != .follow {
                Image("jessica")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else{
                Button {
                    //Todo
                } label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                }

            }
        }
        .padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        NotificationCell(notification: Notification(username: "", profileImageUrl: "", timestamp: Timestamp(), type: NotificationType(rawValue: 1) ?? .comment, uid: ""))
    }
}

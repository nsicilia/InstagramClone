//
//  NotificationCell.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 9/5/22.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = false
    
    var body: some View {
        HStack {
            //Image
            Image("jessica")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            //Name + Notifiaction
            Text("Jessica ")
                .font(.system(size: 14, weight: .semibold))
            +
            Text("Like one of your posts.")
                .font(.system(size: 15))
            
            Spacer()
            
            if showPostImage {
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
                }

            }
        }
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}

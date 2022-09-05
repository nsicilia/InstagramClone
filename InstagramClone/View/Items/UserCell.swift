//
//  UserCell.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 8/28/22.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack{
            
            //Image
            Image("jessica")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            //username, fullname
            VStack(alignment: .leading){
            Text("jessica")
                    .font(.system(size: 14, weight: .semibold))
                
            Text("Jessica Johnson")
                    .font(.system(size: 14))
            }
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}

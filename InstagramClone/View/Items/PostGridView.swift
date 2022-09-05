//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 8/28/22.
//

import SwiftUI

struct PostGridView: View {
    private var items = [GridItem(), GridItem(), GridItem()]
    private var width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 3) {
            
            ForEach(0 ..< 10) { _ in
                NavigationLink {
                    FeedView()
                } label: {
                    Image("jessica")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                }

            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}

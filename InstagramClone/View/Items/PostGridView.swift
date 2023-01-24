//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 8/28/22.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    let config: PostGridConfiguration
    @ObservedObject var viewModel: PostGridViewModel
    
     var items = [GridItem(), GridItem(), GridItem()]
     var width = UIScreen.main.bounds.width / 3
   
    init(config: PostGridConfiguration){
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
    
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 3) {
            
            ForEach(viewModel.posts) { post in
                NavigationLink {
                    FeedView()
                } label: {
                    KFImage(URL(string: post.imageUrl))
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
        PostGridView(config: .explore)
    }
}

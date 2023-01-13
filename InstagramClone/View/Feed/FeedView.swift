//
//  FeedView.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 8/7/22.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 32) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post)
                }
            }
            .padding(.top)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

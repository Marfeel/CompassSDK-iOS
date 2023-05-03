//
//  AllPostsView.swift
//  Playground
//
//  Created by Marc García Lopez on 02/05/2023.
//

import SwiftUI
import CompassSDK

struct AllPosts: View {
    @EnvironmentObject var store: BlogPostsStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.blogPosts) {post in
                    NavigationLink(destination: BlogPostView(blogPost: post)) {
                        BlogPostCardList(blogPost: post)
                    }
                }
            }
            .navigationTitle("All blog posts")
            .listStyle(InsetListStyle())
        }
        .onAppear(perform: {
            CompassTracker.shared.trackNewPage(url: URL(string: "https://dev.marfeel.co")!)
        })
    }
}

//
//  PostView.swift
//  User Posts Test
//
//  Created by Timothy Vermeersch on 6/22/23.
//

import SwiftUI

struct PostView: View {
	var post: Post
    var body: some View {
		 VStack {
			 Text(post.title)
				 .font(.title)
			 Text(post.body)
				 .font(.title3)
		 }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(id: 0, author: 1, title: "Hello World!", body: "This is some mock data"))
    }
}

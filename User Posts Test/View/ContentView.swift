//
//  ContentView.swift
//  User Posts Test
//
//  Created by Timothy Vermeersch on 6/22/23.
//

import SwiftUI

struct ContentView: View {
	@StateObject var postViewModel = PostViewModel()
    var body: some View {
        VStack {
			  List{
				  ForEach(postViewModel.posts){ post in
					  PostView(post: post)
				  }
			  }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

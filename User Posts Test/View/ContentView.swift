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
		 NavigationView {
			 VStack {
				 List{
					 ForEach(1..<11){ i in
						 NavigationLink(destination: {
							 List{
								 ForEach(postViewModel.getPostsByAuthor(i)){ post in
									 
									 PostView(post: post)
								 }
							 }
						 }, label: {
							 Text("User \(String(i)) Posts")
						 })
						 .frame(maxWidth: .infinity)
					 }
				 }
				 .frame(maxWidth: .infinity)
				 .scrollContentBackground(.hidden)
			 }
			 .navigationTitle("Home")
		 }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

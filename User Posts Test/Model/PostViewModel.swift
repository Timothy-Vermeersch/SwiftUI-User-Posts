//
//  PostViewModel.swift
//  User Posts Test
//
//  Created by Timothy Vermeersch on 6/22/23.
//

import Foundation
import Combine

class PostViewModel: ObservableObject {
	@Published var posts: [Post] = []
	
	let service = PostService()
	var cancellable = Set<AnyCancellable>()
	
	init() {
		self.getPosts()
	}
	
	func getPosts() {
		service.fetchPosts()
			.sink{ completion in
				switch completion {
				case .finished:
					break
				case .failure(let err):
					print(err)
				}
			} receiveValue: { [weak self] data in
				print(data)
				self?.posts = data
			}
			.store(in: &cancellable)
	}
}

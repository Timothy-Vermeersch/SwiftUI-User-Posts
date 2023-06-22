//
//  PostService.swift
//  User Posts Test
//
//  Created by Timothy Vermeersch on 6/22/23.
//

import Foundation
import Combine

class PostService {
	var cancellable = Set<AnyCancellable>()
	
	
	func fetchPosts() -> Future<[Post], Error> {
		let searchURL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
		return Future { promise in
			URLSession.shared.dataTaskPublisher(for: searchURL)
				.map { $0.data}
				.decode(type: [Post].self, decoder: JSONDecoder())
				.receive(on: RunLoop.main)
				.sink { completion in
					switch completion {
					case .finished:
						break;
					case .failure(let err):
						promise(.failure(err))
					}
				} receiveValue: { response in
						promise(.success(response))
				}
				.store(in: &self.cancellable)
		}
		
	}
}

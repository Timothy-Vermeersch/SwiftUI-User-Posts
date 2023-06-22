//
//  PostModel.swift
//  User Posts Test
//
//  Created by Timothy Vermeersch on 6/22/23.
//

import Foundation

struct Post: Codable, Identifiable {
	var id: Int
	var author: Int
	var title: String
	var body: String
	
	enum CodingKeys: String, CodingKey{
		case author = "userId"
		case id, title, body
	}
}

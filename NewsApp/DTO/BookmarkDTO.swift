//
//  BookmarkDTO.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 11.05.2023.
//

import Foundation

struct BookmarkDTO: Codable {
    var id: String
    var article: ArticleDTO
    var userId: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case article = "article"
        case userId = "userId"
    }
}

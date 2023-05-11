//
//  BookmarkDTO.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 11.05.2023.
//

import Foundation
import FirebaseFirestoreSwift

struct BookmarkDTO: Codable {
    @DocumentID var id: String?
    var article: ArticleDTO
    var userId: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case article = "article"
        case userId = "userId"
    }
}

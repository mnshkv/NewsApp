//
//  NewsApiResponseDTO.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 10.05.2023.
//

import Foundation

struct NewsApiResponseDTO: Decodable {
    let status: String
    let totalResults: Int
    let articles: [ArticleDTO]
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
    }
}

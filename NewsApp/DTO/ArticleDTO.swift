//
//  ArticleDTO.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 10.05.2023.
//

import Foundation

struct ArticleDTO: Decodable {
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
}

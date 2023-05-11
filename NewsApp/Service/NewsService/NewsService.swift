//
//  NewsService.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 10.05.2023.
//

import Foundation

class NewsService {
    let path: String = "/v2/everything"
    
    public func fetchNews(_ handler: @escaping (NewsApiResponseDTO) -> ()) {
        let urlComponets = NetworkService.configurate(path: path, params: ["q": "bitcoin"])
        NetworkService.makeRequest(url: urlComponets) { data in
            let dto = try! JSONDecoder().decode(NewsApiResponseDTO.self, from: data)
            handler(dto)
        }
    }
    
    public func fetchPersonalNews(_ handler: @escaping (NewsApiResponseDTO) -> ()) {
        let urlComponets = NetworkService.configurate(path: path, params: ["q": "bitcoin"])
        NetworkService.makeRequest(url: urlComponets) { data in
            let dto = try! JSONDecoder().decode(NewsApiResponseDTO.self, from: data)
            handler(dto)
        }
    }
    
}

//
//  NetworkService.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 10.05.2023.
//

import Foundation


class NetworkService {
    private static let apiKey = "a6309cc6e4d1458bb471824c393b1b2e"
    
    static public func configurate(path: String, params: [String: String]) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = path
        urlComponents.queryItems = params.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        return urlComponents
    }
    
    static public func makeRequest(url: URLComponents, handler: @escaping (Data) -> ()) {
        guard let url = url.url else {
            return
        }
        
        var request  = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("make something \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                handler(data)
            }
        }
        .resume()
    }
}

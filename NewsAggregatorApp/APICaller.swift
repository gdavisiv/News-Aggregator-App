//
//  APICaller.swift
//  NewsAggregatorApp
//
//  Created by George Davis IV on 6/2/21.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    struct Constants {
    static let topHeadlinesURL = URL(string:
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY")
    }
    
    private init(){}
    
    public func getTopStories(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    
                    print("Articles: \(result.articles.count)")
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

//Create the models

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
}

struct Source: Codable {
    let name: String
}

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
        
    }
}

//
//  NewsProvider.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 25.08.2021..
//
import Foundation
import Alamofire

class NewsProvider {
    
    let url : URL
    
    init() {
        url = URL(string: Constants.baseUrl + Constants.apiKey)!
    }
    
    func getNews(completionHandler: @escaping ([Article], Bool) -> Void) {
        
        AF.request(url).response { response in
            if let error = response.error {
                print("Error: \(error)")
                completionHandler([], false)
                return
            }
            if let status = response.response?.statusCode {
                switch(status){
                case 200...299:
                    print("success")
                default:
                    print("error with response status: \(status)")
                }
            }
            if let data = response.data,
               let article = try? JSONDecoder().decode(Welcome.self, from: data) {
                completionHandler(article.articles, true)
            }
        }
    }
    
}

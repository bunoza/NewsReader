//
//  NewsProvider.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 25.08.2021..
//
import Foundation

class NewsProvider {
        
    let url : URL
    
    init() {
        url = URL(string: Constants.baseUrl + Constants.apiKey)!
    }
    
    func getNews(completionHandler: @escaping ([Article], Bool) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
            completionHandler([], false)
            return
          }
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
            print("Error with the response, unexpected status code: \(response!)")
            completionHandler([], false)
            return
          }
            do {
                if let data = data,
                   let article = try? JSONDecoder().decode(Welcome.self, from: data) {
                    completionHandler(article.articles, true)
                }
            }
        })
        task.resume()
    }
    
}

//
//  NewsProvider.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 25.08.2021..
//
import Foundation

class NewsProvider {
    
    var controller : ViewController? = nil
    
    let url = URL(string: "https://newsapi.org/v1/articles?source=bbc-news&sortBy=top&apiKey=a1b06087c5f946a8870dcce4593ab1c5")
    
    func getNews(completionHandler: @escaping ([Article], Bool) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
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

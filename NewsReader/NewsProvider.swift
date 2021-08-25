//
//  NewsProvider.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 25.08.2021..
//
import Foundation

class NewsProvider {
    
    let url = URL(string: "https://newsapi.org/v1/articles?source=bbc-news&sortBy=top&apiKey=1862d59c0f704a7aa99b72f9d6763145")
    
    func getNews(completionHandler: @escaping ([Article]) -> Void) {

        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
            return
          }
          
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
            print("Error with the response, unexpected status code: \(response)")
            return
          }
            do {
                if let data = data,
                   let article = try? JSONDecoder().decode(Welcome.self, from: data) {
                    completionHandler(article.articles)
                }
            } 
        })
        task.resume()
    }
    
}

//
//  Repository.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 22.09.2021..
//

import Foundation

enum Status {
    case Loaded
    case Loading
    case Start
    case Error
}

class Repository {
    
    var status : Observable<Status>
    var articles : Observable<[Article]>
    
    let newsProvider : NewsProvider = {
        let newsProvider = NewsProvider()
        return newsProvider
    }()
    
    init(){
        status = Observable(.Start)
        articles = Observable([])
    }
    
    func getNewsData(){
        status.value = .Loading
            newsProvider.getNews { [weak self] articles,successFlag  in
                if successFlag {
                    DispatchQueue.main.async {
                        self?.status.value = .Loaded
                        self?.articles.value = articles
                        self?.refreshAfter(seconds: 300)
                    }
                } else {
                    DispatchQueue.main.async {
                    self?.status.value = .Error
                    }
                }
            }
    }
    
    func refreshAfter(seconds : Double) {
        _ = Timer.scheduledTimer(withTimeInterval: seconds, repeats: false, block: {_ in
            self.getNewsData()
        })
    }
}

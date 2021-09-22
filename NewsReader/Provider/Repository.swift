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
    
    var articles : Observable<[Article]>
    var status : Observable<Status>
    
    let newsProvider : NewsProvider = {
        let newsProvider = NewsProvider()
        return newsProvider
    }()
    
    init(){
        articles = Observable([])
        status = Observable(.Start)
        getNewsData()
    }
    
    func getNewsData() {
        status.value = .Loading
            newsProvider.getNews { [weak self] articles,successFlag  in
                if successFlag {
                    self?.articles.value = articles
                    DispatchQueue.main.async {
                        self?.status.value = .Loaded
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

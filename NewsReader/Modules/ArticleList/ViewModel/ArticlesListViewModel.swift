//
//  ArticlesListViewModel.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 18.09.2021..
//

import Foundation



class ArticlesListViewModel {
    
    var articles : Observable<[Article]>
    var status : Observable<Status>
    let repository : Repository
    
    init(repository: Repository){
        self.articles = Observable([])
        self.status = Observable(.Start)
        self.repository = repository
        setupBindings()
    }
    
    func setupBindings(){
        repository.articles.bind { _ in
            self.articles.value = self.repository.articles.value
        }
        repository.status.bind { _ in
            self.status = self.repository.status
        }
    }
    
    func getNews(){
        repository.getNewsData()
    }
    
    func getStatus() -> Observable<Status> {
        return status
    }
}

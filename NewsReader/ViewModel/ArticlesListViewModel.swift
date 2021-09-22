//
//  ArticlesListViewModel.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 18.09.2021..
//

import Foundation



class ArticlesListViewModel {
    
        
    let repository : Repository = {
        let repository = Repository()
        return repository
    }()
    
    func getArticles() -> Observable<[Article]> {
        return repository.articles
    }
    
    func getStatus() -> Observable<Status> {
        return repository.status
    }
}

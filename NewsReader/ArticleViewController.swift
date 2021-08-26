//
//  ArticleViewController.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 26.08.2021..
//

import UIKit

class ArticleViewController : UIViewController {
    
    let imageview : UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    let articleTitle : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        return title
    }()
    
    let articleContent : UILabel = {
        let content = UILabel()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.numberOfLines = 0
        return content
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(articleTitle)
        view.addSubview(imageview)
        view.addSubview(articleContent)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: view.topAnchor),
            imageview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            imageview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            articleTitle.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: 20),
            articleTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            articleTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            articleContent.topAnchor.constraint(equalTo: articleTitle.bottomAnchor, constant: 20),
            articleContent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            articleContent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            articleContent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

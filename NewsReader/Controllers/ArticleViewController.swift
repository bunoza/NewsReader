//
//  ArticleViewController.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 26.08.2021..
//

import UIKit

class ArticleViewController : UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let articleStackView: ArticleStackView = {
        let articleStackView = ArticleStackView()
        articleStackView.translatesAutoresizingMaskIntoConstraints = false
        return articleStackView
    }()
    
    init(article : Article) {
        super.init(nibName: nil, bundle: nil)
        configureTitle(title: article.title)
        articleStackView.imageview.downloaded(from: article.urlToImage)
        articleStackView.setTitleText(title: article.title)
        articleStackView.setContentText(text: article.description)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackButton(title: "News reader")
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(articleStackView)
    }
    
    func configureTitle(title : String) {
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont.init(name: "Avenir Next Condensed Bold", size: 20)!]
        self.navigationController?.navigationBar.barTintColor = UIColor.blue
        self.navigationItem.title = title
    }
    
    func configureBackButton(title : String) {
        self.navigationItem.backBarButtonItem?.title = title
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            articleStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            articleStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
}

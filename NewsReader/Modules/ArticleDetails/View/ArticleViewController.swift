//
//  ArticleViewController.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 26.08.2021..
//

import UIKit

class ArticleViewController : UIViewController {
    
    let currentArticle : Article
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let imageview : UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    let articleStackView: ArticleStackView = {
        let articleStackView = ArticleStackView()
        articleStackView.translatesAutoresizingMaskIntoConstraints = false
        return articleStackView
    }()
    
    init(article : Article) {
        currentArticle = article
        super.init(nibName: nil, bundle: nil)
    }
    
    func setupCurrentArticle() {
        configureTitle(title: currentArticle.title)
        imageview.setImageFromUrl(url: currentArticle.urlToImage)
        articleStackView.setTitleText(title: currentArticle.title)
        articleStackView.setContentText(text: currentArticle.description)
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
        setupCurrentArticle()
    }
    
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(articleStackView)
        scrollView.addSubview(imageview)
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
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        imageview.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalToSuperview()
        }
        articleStackView.snp.makeConstraints { make in
            make.top.equalTo(imageview.snp.bottom)
            make.width.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

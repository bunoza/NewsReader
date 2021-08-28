//
//  ViewController.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 25.08.2021..
//

import UIKit

class ViewController: UIViewController {
    
    var articles : [Article] = []
    var updateFlag : Bool = false

    let newsProvider : NewsProvider = {
        let newsProvider = NewsProvider()
        return newsProvider
    }()
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
        
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle(title: "News reader")
        setupViews()
        setupConstraints()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getNewsData()
    }
    
    func getNewsData() {
        if articles.count == 0 || updateFlag {
            updateFlag = false
            newsProvider.setController(controller: self)
            newsProvider.getNews { [weak self] articles in
                self?.articles = articles
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    @objc func refreshData() {
        updateFlag = true
        getNewsData()
    }

    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func showErrorMessage() {
        let alert = UIAlertController().getCustomAlert()
        self.present(alert, animated: true, completion: nil)
    }
}



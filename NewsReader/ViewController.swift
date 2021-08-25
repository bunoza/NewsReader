//
//  ViewController.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 25.08.2021..
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var characters = ["Link", "Zelda", "Ganondorf", "Midna"]
    var articles: [Article] = []
    
    let newsProvider : NewsProvider = {
        let temp = NewsProvider()
        return temp
    }()
    
    let tableView : UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
        
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        newsProvider.getNews { [weak self] articles in
            self?.articles = articles
            print(articles)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
              }
        }
    }

    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return articles.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = articles[indexPath.row].title
    return cell
  }
}

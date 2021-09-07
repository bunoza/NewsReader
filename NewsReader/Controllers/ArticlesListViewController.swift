//
//  ViewController.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 25.08.2021..
//

import UIKit

class ArticleListNewsController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate {
    
    var articles : [Article]
    var updateFlag : Bool

    let newsProvider : NewsProvider = {
        let newsProvider = NewsProvider()
        return newsProvider
    }()
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init() {
        articles = []
        updateFlag = false
        super.init(nibName: nil, bundle: nil)
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
            showOverlay(on: self)
            newsProvider.getNews { [weak self] articles,successFlag  in
                if successFlag {
                    self?.articles = articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                        self?.dismissOverlay(on: self!)
                        self?.refreshAfter(seconds: 300)
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.dismissOverlay(on: self!)
                        self?.refreshAfter(seconds: 300)
                        self?.showErrorAlert(on: self!)
                    }
                }
            }
        }
    }
    
    func refreshAfter(seconds : Double) {
        _ = Timer.scheduledTimer(withTimeInterval: seconds, repeats: false, block: {_ in
            self.updateFlag = true
            self.getNewsData()
        })
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
    
    func configureTitle(title : String) {
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont.init(name: "Avenir Next Condensed Bold", size: 20)!]
        self.navigationController?.navigationBar.barTintColor = UIColor.blue
        self.navigationItem.title = title
    }
    
    func configureBackButton(title : String) {
        self.navigationItem.backBarButtonItem?.title = title
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCellView.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let controller = ArticleViewController(article: articles[indexPath.row])
        controller.modalPresentationStyle = .overCurrentContext
        controller.transitioningDelegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return articles.count
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell: CustomCellView = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCellView
      cell.configure(with: articles[indexPath.row])
      return cell
    }
}

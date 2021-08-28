//
//  ViewController+Extensions.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 27.08.2021..
//

import UIKit
extension ViewController : UIViewControllerTransitioningDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func showOverlay() {
        let loadingVC = LoadingViewController()
        loadingVC.modalPresentationStyle = .overCurrentContext
        loadingVC.modalTransitionStyle = .crossDissolve
        present(loadingVC, animated: true, completion: nil)
    }
    
    func dismissOverlay(flag : Bool) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: {
                if flag {
                    self.showErrorMessage()
                }
            })
        }
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
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return articles.count
    }
      
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell: CustomCellView = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCellView
      cell.configure(with: articles[indexPath.row])
      return cell
    }
    
    
}

//
//  UIViewController+Extensions.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 28.08.2021..
//

import UIKit

extension UIViewController {
    
    func configureTitle(title : String) {
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont.init(name: "Avenir Next Condensed Bold", size: 20)!]
        self.navigationController?.navigationBar.barTintColor = UIColor.blue
        self.navigationItem.title = title
    }
    
    func configureBackButton(title : String) {
        self.navigationItem.backBarButtonItem?.title = title
    }
}

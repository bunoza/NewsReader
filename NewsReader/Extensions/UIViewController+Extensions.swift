//
//  UIViewController+Extensions.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 01.09.2021..
//

import UIKit

extension UIViewController {
    
    func showErrorAlert(on viewController: UIViewController) {
        let alert = UIAlertController(title: "Error", message: "Oops, an error has occured.", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        viewController.present(alert, animated: true, completion: nil)
    }
    
}

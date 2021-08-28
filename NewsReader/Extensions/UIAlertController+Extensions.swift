//
//  UIAlertController+Extensions.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 28.08.2021..
//

import UIKit
extension UIAlertController {
    
    func getCustomAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Error", message: "Oops, an error has occured.", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        return alert
    }
    
}

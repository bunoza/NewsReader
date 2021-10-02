//
//  UIImageView+Extensions.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 25.08.2021..
//
import UIKit

extension UIImageView {
    func setImageFromUrl(url : String) {
        self.kf.setImage(with: URL(string: url), placeholder: nil, options: [], completionHandler: nil)
    }
}


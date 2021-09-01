//
//  ViewController+Extensions.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 27.08.2021..
//

import UIKit
extension ViewController {
    
    func showOverlay(on viewController : UIViewController) {
        let blurLoaderOverlay = BlurLoaderOverlay()
        blurLoaderOverlay.showOverlay(on: viewController)
    }
    
    func dismissOverlay(on viewController : UIViewController) {
        let blurLoaderOverlay = BlurLoaderOverlay()
        blurLoaderOverlay.dismissOverlay(on: viewController, flag: false)
    }
}

//
//  ArticleStackView.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 28.08.2021..
//

import UIKit

class ArticleStackView: UIView {
    
    let imageview : UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    let articleTitle : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        return title
    }()
    
    let articleContent : UILabel = {
        let content = UILabel()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.numberOfLines = 0
        return content
    }()
    
    let stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.distribution = .fill
        stackview.alignment = .firstBaseline
        stackview.spacing = 5
        return stackview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    func setImage(image : UIImage) {
        imageview.image = image
    }
    
    func setTitleText(title : String) {
        articleTitle.attributedText = NSAttributedString(string: title, attributes: [.font : UIFont.boldSystemFont(ofSize: 17)])
    }
    
    func setContentText(text : String) {
        articleContent.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        stackview.addArrangedSubview(imageview)
        stackview.addArrangedSubview(articleTitle)
        stackview.addArrangedSubview(articleContent)
        self.addSubview(stackview)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: self.topAnchor),
            stackview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageview.heightAnchor.constraint(equalToConstant: 240),
        ])
    }
}

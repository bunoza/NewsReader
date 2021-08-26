//
//  CustomCell.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 25.08.2021..
//

import UIKit

class CustomCellView: UITableViewCell {
    
    
    let image : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let title : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        return title
    }()
    
    let stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.distribution = .fillProportionally
        stackview.spacing = 10
        return stackview
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.white
        stackview.addArrangedSubview(image)
        stackview.addArrangedSubview(title)
        contentView.addSubview(stackview)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with article: Article) {
        title.text = article.title
        image.downloaded(from: article.urlToImage)
    }

    func setupConstraints(){
        NSLayoutConstraint.activate([
           stackview.topAnchor.constraint(equalTo: contentView.topAnchor),
           stackview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
           stackview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
           stackview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackview.heightAnchor.constraint(equalToConstant: 80),
            image.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
}

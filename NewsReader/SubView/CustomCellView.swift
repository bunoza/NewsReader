//
//  CustomCell.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 25.08.2021..
//
import UIKit
import Kingfisher

class CustomCellView: UITableViewCell {
    
    let image : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let title : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 1
        return title
    }()
    
    let articleDescription : UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 2
        return description
    }()
    
    let stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 15
        return stackview
    }()
    
    let textContent: UIStackView = {
        let textContent = UIStackView()
        textContent.translatesAutoresizingMaskIntoConstraints = false
        textContent.axis = .vertical
        textContent.alignment = .center
        textContent.distribution = .fillEqually
        return textContent
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textContent.addArrangedSubview(title)
        textContent.addArrangedSubview(articleDescription)
        stackview.addArrangedSubview(image)
        stackview.addArrangedSubview(textContent)
        contentView.addSubview(stackview)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with article: Article) {
        title.attributedText = NSAttributedString(string: article.title, attributes: [.font : UIFont.boldSystemFont(ofSize: 17)])
        articleDescription.attributedText = NSAttributedString(string: article.description, attributes: [.font : UIFont.systemFont(ofSize: 15), .foregroundColor : UIColor.gray])
        image.setImageFromUrl(url: article.urlToImage)
    }

    func setupConstraints() {
        image.snp.makeConstraints { make in
            make.size.equalTo(100)
        }
        stackview.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20))
        }
    }
}

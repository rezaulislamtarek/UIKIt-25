//
//  ArticleCellTableViewCell.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 12/11/25.
//

import UIKit

class ArticleCellTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ArticleCell"
    let titleLabel: UILabel = UILabel()
    let authorLabel: UILabel = UILabel()
    let dateLabel: UILabel = UILabel()
    let summaryLabel: UILabel = UILabel()
    let articleImageView: UIImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        articleImageView.contentMode = .scaleAspectFill
        articleImageView.clipsToBounds = true
        articleImageView.layer.cornerRadius = 8
        articleImageView.backgroundColor = .systemGray6
        
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 2
        
        authorLabel.font = .systemFont(ofSize: 15, weight: .regular)
        authorLabel.textColor = .secondaryLabel
        
        dateLabel.font = .systemFont(ofSize: 15, weight: .regular)
        dateLabel.textColor = .secondaryLabel
        
        summaryLabel.font = .systemFont(ofSize: 18, weight: .regular)
        summaryLabel.textColor = .black.withAlphaComponent(0.9)
        summaryLabel.numberOfLines = 0
        summaryLabel.textAlignment = .justified
        
        contentView.addSubviews( articleImageView, titleLabel, authorLabel, dateLabel, summaryLabel)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            articleImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            articleImageView.heightAnchor.constraint(equalToConstant: 50),
            articleImageView.widthAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: articleImageView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            summaryLabel.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 12),
            summaryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            summaryLabel.leadingAnchor.constraint(equalTo: articleImageView.leadingAnchor, constant: 0),
            summaryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
             
        ])
    }
    
    func config(with article : Article){
        titleLabel.text = article.title
        summaryLabel.text = article.summary
        
        // Image loading (placeholder for now)
        if let _ = article.imageUrl {
            articleImageView.backgroundColor = .systemBlue.withAlphaComponent(0.3)
        } else {
            articleImageView.backgroundColor = .systemGray5
        }
    }
    
}

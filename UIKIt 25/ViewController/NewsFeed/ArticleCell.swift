//
//  ArticleCellTableViewCell.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 12/11/25.
//

import UIKit

protocol ArticleCellDelegate: AnyObject {
    func didTapOnFavouriteButton(cell: ArticleCell)
}

class ArticleCell: UITableViewCell {
    
    static let reuseIdentifier = "ArticleCell"
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 2
        return label
    }()
    let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .tertiaryLabel
        return label
    }()
    let summaryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black.withAlphaComponent(0.9)
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    let articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    private let infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .leading
        return stack
    }()
    let favouriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .systemGray3
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.setImage(UIImage(systemName: "star.fill"), for: .selected)
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        return button
    }()
    
    weak var delegate: ArticleCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        infoStackView.addArrangedSubview(titleLabel)
        infoStackView.addArrangedSubview(authorLabel)
        infoStackView.addArrangedSubview(dateLabel)
        favouriteButton.addTarget(self, action: #selector(favouriteButtonTapped), for: .touchUpInside)
        
        contentView.addSubviews(articleImageView, infoStackView, summaryLabel, favouriteButton)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            articleImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            articleImageView.heightAnchor.constraint(equalToConstant: 64),
            articleImageView.widthAnchor.constraint(equalToConstant: 64),
            
            favouriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            favouriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            favouriteButton.widthAnchor.constraint(equalToConstant: 32),
            favouriteButton.heightAnchor.constraint(equalTo: favouriteButton.widthAnchor),
            
            infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            infoStackView.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: 12),
            infoStackView.trailingAnchor.constraint(equalTo: favouriteButton.leadingAnchor, constant: -12),
            
            summaryLabel.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 12),
            summaryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            summaryLabel.leadingAnchor.constraint(equalTo: articleImageView.leadingAnchor, constant: 0),
            summaryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
             
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
         
    }
    
    func config(with article : Article){
        titleLabel.text = article.title
        authorLabel.text = article.author
        dateLabel.text = article.date
        summaryLabel.text = article.summary
        setFavourite(article.isFavourite)
        
        // Image loading (placeholder for now)
        if let _ = article.imageUrl {
            articleImageView.backgroundColor = .systemBlue.withAlphaComponent(0.3)
        } else {
            articleImageView.backgroundColor = .systemGray5
        }
    }
    
    func setFavourite(_ isFavourite: Bool) {
        favouriteButton.isSelected = isFavourite
        favouriteButton.tintColor = isFavourite ? .systemYellow : .systemGray3
    }
    
    @objc private func favouriteButtonTapped() {
        delegate?.didTapOnFavouriteButton(cell: self)
    }
    
}

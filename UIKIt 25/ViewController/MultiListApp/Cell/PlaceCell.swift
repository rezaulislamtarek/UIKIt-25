//
//  PlaceCell.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 16/11/25.
//

import UIKit

class PlaceCell: UITableViewCell {
    static let reuseIdentifier = "PlaceCell"
    
    private let thumbImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .secondarySystemBackground
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let containerView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 8
        v.backgroundColor = .systemBackground
        v.layer.borderWidth = 0.5
        v.layer.borderColor = UIColor.separator.cgColor
        v.layer.masksToBounds = true
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(thumbImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subTitleLabel)
        
        thumbImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            thumbImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            thumbImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            thumbImageView.widthAnchor.constraint(equalToConstant: 60),
            thumbImageView.heightAnchor.constraint(equalTo: thumbImageView.widthAnchor, constant: -12),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: thumbImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor ),
            subTitleLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -10),
            
        ])
    }
    
    func config(with place: Place){
        titleLabel.text = place.placeName
        subTitleLabel.text = place.villageName + ", " + place.unionName
        thumbImageView.setImageFromURL(Endpoints.baseUrl+place.photo)
    }
}

//
//  AmbulanceCell.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 16/11/25.
//

import UIKit

final class AmbulanceCell: UITableViewCell {
    static let reuseIdentifier = "AmbulanceCell"
    
    private let namelabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 16)
        l.numberOfLines = 2
        return l
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemBlue
        label.numberOfLines = 1
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    private let facilityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGreen
        label.numberOfLines = 1
        return label
    }()
    
    private let containerView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.backgroundColor = .systemBackground
        view.layer.borderColor = UIColor.separator.cgColor
        view.layer.borderWidth = 2
        view.layer.masksToBounds = true
        return view
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
        let stack = UIStackView(arrangedSubviews: [
            namelabel,
            phoneLabel,
            addressLabel,
            facilityLabel
        ])
        stack.axis = .vertical
        stack.spacing = 4
        containerView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            stack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            stack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            stack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            stack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
        ])
    }
    
    func configure(with transport: Transport) {
        namelabel.text = transport.nameOrModel
        phoneLabel.text = "📞 \(transport.phoneNumber)"
        addressLabel.text = transport.address.isEmpty ? "Address: N/A" : transport.address
        
        if transport.facility.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            facilityLabel.text = nil
        } else {
            facilityLabel.text = "Facility: \(transport.facility)"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        namelabel.text = nil
        phoneLabel.text = nil
        addressLabel.text = nil
        facilityLabel.text = nil
    }
}

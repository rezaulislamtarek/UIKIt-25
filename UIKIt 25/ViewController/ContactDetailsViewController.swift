//
//  ContactDetailsViewController.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 11/11/25.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    let contact: Contact
    
    let label = UILabel()

    
    init(contact: Contact) {
        self.contact = contact
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraint()
    }
    
    func setupUI(){
        label.text = "\(contact.name)\n \(contact.phone)\n \(contact.email)"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .link
        label.numberOfLines = 0
        view.addSubview(label)
    }
    
    func setupConstraint(){
        label.topToSafeArea(of: view, 60, alignCenterX: true)
    }
}


#Preview{
    ContactDetailsViewController(contact: Contact.allContacts.first!)
}

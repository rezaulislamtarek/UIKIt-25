//
//  DetailsViewController.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 9/11/25.
//

import UIKit

class ContactListViewController: UIViewController {
    let constContactTableIdendifier: String = "ContactTableViewIdendifier"
    let contactTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupUI()
        setupConstraint()
 
    }
    
    func setupUI(){
        contactTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactTableView)
        //Register cell
        contactTableView.register(UITableViewCell.self, forCellReuseIdentifier: constContactTableIdendifier)
        
        //set delegates
        contactTableView.dataSource = self
        contactTableView.delegate = self
        
        contactTableView.rowHeight = UITableView.automaticDimension
        contactTableView.separatorStyle = .singleLine
        
    }
    
    func setupConstraint(){
//        contactTableView.topToSafeArea(of: view)
//        contactTableView.setDefultConstraints(view: view)
//        contactTableView.bottomToTopOf(view)
        let guide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                contactTableView.topAnchor.constraint(equalTo: guide.topAnchor),
                contactTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                contactTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                contactTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }

}

extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Contact.allContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: constContactTableIdendifier, for: indexPath)
        let contact = Contact.allContacts[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = contact.name
        content.secondaryText = contact.phone
        content.image = UIImage(systemName: "person.circle")
        cell.contentConfiguration = content
        return cell
    }
}

extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedContact = Contact.allContacts[indexPath.row]
        navigateToContactLIstDetailsViewController(for: selectedContact )
    }
    
    func navigateToContactLIstDetailsViewController(for contact: Contact) {
        let contactDetailsViewController = ContactDetailsViewController(contact: contact)
        navigationController?.pushViewController(contactDetailsViewController, animated: true)
    }
}

#Preview{
    ContactListViewController()
}

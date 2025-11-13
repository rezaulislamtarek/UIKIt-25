
//
//  HomeViewController.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 9/11/25.
//

import UIKit

class HomeViewController: UIViewController {

   
    let contactAppButton = UIButton()
    let articleAppButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true

        setupUI()
        setupConsraints()
        setupAction()
    }

    func setupAction(){
        contactAppButton.addTarget(self, action: #selector(navigateToContactList), for: .touchUpInside)
        articleAppButton.addTarget(self, action: #selector(navigateToArticle), for: .touchUpInside)
    }

    func setupUI(){
        
        contactAppButton.setTitle("Contact App", for: .normal)
        contactAppButton.backgroundColor = .systemBlue
        contactAppButton.layer.cornerRadius = 8
        view.addSubview(contactAppButton)
        
        articleAppButton.setTitle("Article App ", for: .normal)
        articleAppButton.backgroundColor = .systemBlue
        articleAppButton.layer.cornerRadius = 8
        view.addSubview(articleAppButton)
    }

    func setupConsraints(){
        
        contactAppButton.setDefultConstraints(view: view, height: 50)
        contactAppButton.topToSafeArea(of: view, 40)
        
        articleAppButton.setDefultConstraints(view: view, height: 50)
        articleAppButton.topToBottomOf(contactAppButton, 16)
    }

    @objc func navigateToContactList() {
        let vc = ContactListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func navigateToArticle() {
        let vc = NewsFeedViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

#Preview{
    HomeViewController()
}

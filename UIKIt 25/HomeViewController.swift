
//
//  HomeViewController.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 9/11/25.
//

import UIKit

class HomeViewController: UIViewController {

   
    let contactAppButton = UIButton()

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
        contactAppButton.addTarget(self, action: #selector(navigateToDetails), for: .touchUpInside)
    }

    func setupUI(){
        
        contactAppButton.setTitle("Contact App", for: .normal)
        contactAppButton.backgroundColor = .systemBlue
        contactAppButton.layer.cornerRadius = 8
        view.addSubview(contactAppButton)
    }

    func setupConsraints(){
        
        contactAppButton.setDefultConstraints(view: view, height: 50)
        contactAppButton.topToSafeArea(of: view, 40)
    }

    @objc func navigateToDetails() {
        let detailsVC = ContactListViewController()
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

#Preview{
    HomeViewController()
}

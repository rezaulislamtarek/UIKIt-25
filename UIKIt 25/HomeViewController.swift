
//
//  HomeViewController.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 9/11/25.
//

import UIKit

class HomeViewController: UIViewController {

    let avatarImageView = UIImageView()
    let usernameLabel = UILabel()
    let infoContainer = UIView()
    let ageLabel = UILabel()
    let jobLabel = UILabel()
    let emailLabel = UILabel()
    let detailsButton = UIButton()

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
        detailsButton.addTarget(self, action: #selector(navigateToDetails), for: .touchUpInside)
    }

    func setupUI(){
        avatarImageView.image = UIImage(systemName: "person.circle.fill")
        avatarImageView.tintColor = .systemBlue
        avatarImageView.backgroundColor = .systemGray6
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.clipsToBounds = true
        view.addSubview(avatarImageView)

        usernameLabel.text = "tarek.prog"
        usernameLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        usernameLabel.textAlignment = .center
        view.addSubview(usernameLabel)

        infoContainer.backgroundColor = .clear
        view.addSubview(infoContainer)

        ageLabel.text = "Age 29"
        ageLabel.font = .systemFont(ofSize: 16, weight: .medium)
        ageLabel.textAlignment = .center
        infoContainer.addSubview(ageLabel)

        jobLabel.text = "Software Engineer"
        jobLabel.font = .systemFont(ofSize: 16)
        jobLabel.textColor = .secondaryLabel
        jobLabel.textAlignment = .center
        infoContainer.addSubview(jobLabel)

        emailLabel.text = "tarek.prog@example.com"
        emailLabel.font = .systemFont(ofSize: 15)
        emailLabel.textAlignment = .center
        emailLabel.textColor = .secondaryLabel
        view.addSubview(emailLabel)

        detailsButton.setTitle("Want to see Details", for: .normal)
        detailsButton.backgroundColor = .systemBlue
        detailsButton.layer.cornerRadius = 8
        view.addSubview(detailsButton)
    }

    func setupConsraints(){
        avatarImageView.topToSafeArea(of: view, 32, alignCenterX: true)
        avatarImageView.setSize(width: 80, height: 80)

//        usernameLabel.setDefultConstraints(view: view)
        usernameLabel.topToBottomOf(avatarImageView, 16, alignCenterX: true)

        infoContainer.topToBottomOf(usernameLabel, 8, alignCenterX: true)

        ageLabel.startToStartOf(infoContainer)
        ageLabel.topToTopOf(infoContainer)
        ageLabel.bottomToBottomOf(infoContainer)

        jobLabel.startToEndOf(ageLabel, 4)
        jobLabel.topToTopOf(infoContainer)
        jobLabel.bottomToBottomOf(infoContainer)
        jobLabel.endToEndOf(infoContainer)
        jobLabel.firstBaselineAnchor.constraint(equalTo: ageLabel.firstBaselineAnchor).isActive = true

        emailLabel.setDefultConstraints(view: view)
        emailLabel.topToBottomOf(infoContainer, 8)

        detailsButton.setDefultConstraints(view: view, height: 50)
        detailsButton.topToBottomOf(emailLabel, 24)
    }

    @objc func navigateToDetails() {
        let detailsVC = ContactListViewController()
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

#Preview{
    HomeViewController()
}

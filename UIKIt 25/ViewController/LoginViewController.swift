//
//  ViewController.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 9/11/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    let loginButton = UIButton()
    let uiLabel: UILabel = UILabel()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    let uiLabelDefaultText = "Enter your email and password and click login button to login."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Login"
        navigationController?.navigationBar.prefersLargeTitles = true
        setUpView()
        setupConstraints()
        setupAction()
    }
    
    func setUpView(){
        emailTextField = makeTextField()
        emailTextField.placeholder = "Email"
        view.addSubview(emailTextField)
        
        passwordTextField = makeTextField()
        passwordTextField.placeholder = "Password"
        view.addSubview(passwordTextField)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.layer.cornerRadius = 8
        view.addSubview(loginButton)
        
        uiLabel.text = uiLabelDefaultText
        uiLabel.textColor = .label
        uiLabel.textAlignment = .center
        uiLabel.numberOfLines = 0
        uiLabel.lineBreakMode = .byWordWrapping
        view.addSubview(uiLabel)
        
        emailTextField.text = "reza@test.com"
        passwordTextField.text = "secret"
        
        // 🔵 Circular progress indicator
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .systemBlue
        view.addSubview(activityIndicator)
        
    }
    
    func setupAction(){
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    func setupConstraints(){
        
        // email
        emailTextField.setDefultConstraints(view: view, height: 50)
        NSLayoutConstraint.activate([ emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100) ])
        
        //password
        passwordTextField.setDefultConstraints(view: view, height: 50)
        passwordTextField.topToBottomOf(emailTextField, 16)
        
        //button
        loginButton.setDefultConstraints(view: view, height: 50)
        loginButton.topToBottomOf(passwordTextField, 20)
        
        //label
        uiLabel.setDefultConstraints(view: view)
        uiLabel.topToBottomOf(loginButton, 24)
        
        //progressbar
        activityIndicator.setDefultConstraints(view: view)
        activityIndicator.topToBottomOf(loginButton, 8, alignCenterX: true)
        
    }
    
    @objc func loginButtonTapped(){
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            uiLabel.text = "Email or Password is empty"
            uiLabel.textColor = .red
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(resetAfter2Sec), userInfo: nil, repeats: false)
            return
        }
        startLoading()
        uiLabel.text = "\(email) \(password)"
        Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(navigateToHome), userInfo: nil, repeats: false)
    }
    
    func startLoading(){
        activityIndicator.startAnimating()
    }
    
    func stopLoading(){
        activityIndicator.stopAnimating()
    }
    
    @objc func resetAfter2Sec(){
        uiLabel.text = uiLabelDefaultText
        uiLabel.textColor = .label
    }
    
    @objc func navigateToHome(){
        stopLoading()
        //        navigationController?.pushViewController(HomeViewController(), animated: true)
        let home = HomeViewController()
        navigationController?.setViewControllers([home], animated: true)
    }
}

#Preview{
    LoginViewController()
}

extension LoginViewController {
    func makeTextField() -> UITextField{
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        
        return textField
    }
}

 

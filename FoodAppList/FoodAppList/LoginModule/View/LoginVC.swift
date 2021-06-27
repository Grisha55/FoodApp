//
//  LoginVC.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit

class LoginVC: UIViewController {

    // MARK: - Properties
    private var titleLabel = UILabel()
    private let smallStackView = UIStackView()
    private let bigStackView = UIStackView()
    private let loginTF = UITextField()
    private let passwordTF = UITextField()
    private let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureTitleLabel()
        configureLoginTF()
        configurePasswordTF()
        configureLogInButton()
        configureSmallStackView()
        configureBigStackView()
        
        setTitleLabelConstraints()
        setPasswordTFConstraints()
        setLoginTFConstraints()
        setLoginButtonConstraints()
        setSmallStackViewConstraints()
        setBigStackViewConstraints()
    }
    
    private func configureBigStackView() {
        view.addSubview(bigStackView)
        bigStackView.axis = .vertical
        bigStackView.alignment = .center
        bigStackView.distribution = .fill
        bigStackView.spacing = 30
        
        bigStackView.addArrangedSubview(smallStackView)
        bigStackView.addArrangedSubview(loginButton)
    }
    
    private func configureSmallStackView() {
        smallStackView.axis = .vertical
        smallStackView.alignment = .center
        smallStackView.distribution = .fillEqually
        smallStackView.spacing = 20
        
        smallStackView.addArrangedSubview(loginTF)
        smallStackView.addArrangedSubview(passwordTF)
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "LOG IN"
        titleLabel.font = titleLabel.font.withSize(60)
        titleLabel.textColor = .black
    }
    
    private func configureLoginTF() {
        loginTF.placeholder = "Enter your Login"
        loginTF.layer.cornerRadius = 8
        loginTF.layer.borderWidth = 1
        loginTF.layer.borderColor = UIColor.black.cgColor
    }
    
    private func configurePasswordTF() {
        passwordTF.placeholder = "Enter your Password"
        passwordTF.layer.cornerRadius = 8
        passwordTF.layer.borderWidth = 1
        passwordTF.layer.borderColor = UIColor.black.cgColor
    }
    
    private func configureLogInButton() {
        loginButton.setTitle("LOG IN", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.backgroundColor = .orange
        loginButton.layer.cornerRadius = 8
        loginButton.addTarget(self, action: #selector(buttonLogInAction), for: .touchUpInside)
    }
    
    @objc func buttonLogInAction() {
        // TODO: There will be the loginAction to Firebase and after that we will go to SearchVC
    }
    
    private func setPasswordTFConstraints() {
        passwordTF.translatesAutoresizingMaskIntoConstraints                                                 = false
        passwordTF.heightAnchor.constraint(equalToConstant: 50).isActive                                     = true
        passwordTF.trailingAnchor.constraint(equalTo: smallStackView.trailingAnchor, constant: -40).isActive = true
    }
    
    private func setLoginTFConstraints() {
        loginTF.translatesAutoresizingMaskIntoConstraints                                                 = false
        loginTF.heightAnchor.constraint(equalToConstant: 50).isActive                                     = true
        loginTF.trailingAnchor.constraint(equalTo: smallStackView.trailingAnchor, constant: -40).isActive = true
    }
    
    private func setLoginButtonConstraints() {
        loginButton.translatesAutoresizingMaskIntoConstraints                                               = false
        loginButton.trailingAnchor.constraint(equalTo: bigStackView.trailingAnchor, constant: -40).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive                                   = true
    }
    
    private func setSmallStackViewConstraints() {
        smallStackView.translatesAutoresizingMaskIntoConstraints                                = false
        smallStackView.trailingAnchor.constraint(equalTo: bigStackView.trailingAnchor).isActive = true
    }
    
    private func setBigStackViewConstraints() {
        bigStackView.translatesAutoresizingMaskIntoConstraints                                      = false
        bigStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 200).isActive = true
        bigStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive               = true
        bigStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                 = true
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints                             = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive        = true
    }
    
}

//
//  SignUpVC.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit

class SignUpVC: UIViewController {

    // MARK: Properties
    private var titleLabel = UILabel()
    private let smallStackView = UIStackView()
    private let bigStackView = UIStackView()
    private let nameTF = UITextField()
    private let loginTF = UITextField()
    private let passwordTF = UITextField()
    private let createAccountButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureTitleLabel()
        configureNameTF()
        configureLoginTF()
        configurePasswordTF()
        configureCreateAccountButton()
        configureSmallStackView()
        configureBigStackView()
        
        setTitleLabelConstraints()
        setNameTFConstraints()
        setLoginTFConstraints()
        setPasswordTFConstraints()
        setCreateAccountButtonConstraints()
        setSmallStackViewConstraints()
        setBigStackViewConstraints()
    }
    
    // MARK: - Methods
    private func configureBigStackView() {
        view.addSubview(bigStackView)
        bigStackView.axis = .vertical
        bigStackView.alignment = .center
        bigStackView.distribution = .fill
        bigStackView.spacing = 30
        
        bigStackView.addArrangedSubview(smallStackView)
        bigStackView.addArrangedSubview(createAccountButton)
    }
    
    private func configureSmallStackView() {
        smallStackView.axis = .vertical
        smallStackView.alignment = .center
        smallStackView.distribution = .fillEqually
        smallStackView.spacing = 20
        
        smallStackView.addArrangedSubview(nameTF)
        smallStackView.addArrangedSubview(loginTF)
        smallStackView.addArrangedSubview(passwordTF)
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "SIGN UP"
        titleLabel.textColor = .black
        titleLabel.font = titleLabel.font.withSize(60)
    }
    
    private func configureNameTF() {
        nameTF.placeholder = "Enter your name"
        nameTF.layer.cornerRadius = 8
        nameTF.layer.borderWidth = 1
        nameTF.layer.borderColor = UIColor.black.cgColor
    }
    
    private func configureLoginTF() {
        loginTF.placeholder = "Enter new Login"
        loginTF.layer.cornerRadius = 8
        loginTF.layer.borderWidth = 1
        loginTF.layer.borderColor = UIColor.black.cgColor
        loginTF.autocapitalizationType = .none
    }
    
    private func configurePasswordTF() {
        passwordTF.placeholder = "Enter new Password"
        passwordTF.layer.cornerRadius = 8
        passwordTF.layer.borderWidth = 1
        passwordTF.layer.borderColor = UIColor.black.cgColor
        passwordTF.autocapitalizationType = .none
        passwordTF.isSecureTextEntry = true
    }
    
    private func configureCreateAccountButton() {
        createAccountButton.setTitle("CREATE ACCOUNT", for: .normal)
        createAccountButton.setTitleColor(.black, for: .normal)
        createAccountButton.backgroundColor = .orange
        createAccountButton.layer.cornerRadius = 8
        createAccountButton.layer.borderWidth = 1
        createAccountButton.layer.borderColor = UIColor.black.cgColor
        createAccountButton.addTarget(self, action: #selector(createAccountButtonAction), for: .touchUpInside)
    }
    
    @objc func createAccountButtonAction() {
        guard let name = nameTF.text, let login = loginTF.text, let password = passwordTF.text, !name.isEmpty, !login.isEmpty, !password.isEmpty, let nv = navigationController else {
            Alerts().loginAlert(controller: self)
            return
        }
        FirebaseStore().existUser(name: name, login: login, password: password, nv: nv, vc: self)
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints                             = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive        = true
    }
    
    private func setNameTFConstraints() {
        nameTF.translatesAutoresizingMaskIntoConstraints                                                 = false
        nameTF.trailingAnchor.constraint(equalTo: smallStackView.trailingAnchor, constant: -40).isActive = true
        nameTF.heightAnchor.constraint(equalToConstant: 50).isActive                                     = true
    }
    
    private func setLoginTFConstraints() {
        loginTF.translatesAutoresizingMaskIntoConstraints                                                 = false
        loginTF.trailingAnchor.constraint(equalTo: smallStackView.trailingAnchor, constant: -40).isActive = true
        loginTF.heightAnchor.constraint(equalToConstant: 50).isActive                                     = true
    }
    
    private func setPasswordTFConstraints() {
        passwordTF.translatesAutoresizingMaskIntoConstraints                                                 = false
        passwordTF.trailingAnchor.constraint(equalTo: smallStackView.trailingAnchor, constant: -40).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 50).isActive                                     = true
    }
    
    private func setCreateAccountButtonConstraints() {
        createAccountButton.translatesAutoresizingMaskIntoConstraints                                               = false
        createAccountButton.trailingAnchor.constraint(equalTo: bigStackView.trailingAnchor, constant: -40).isActive = true
        createAccountButton.heightAnchor.constraint(equalToConstant: 50).isActive                                   = true
    }
    
    private func setSmallStackViewConstraints() {
        smallStackView.translatesAutoresizingMaskIntoConstraints                                = false
        smallStackView.trailingAnchor.constraint(equalTo: bigStackView.trailingAnchor).isActive = true
    }
    
    private func setBigStackViewConstraints() {
        bigStackView.translatesAutoresizingMaskIntoConstraints                                      = false
        bigStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100).isActive = true
        bigStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive               = true
        bigStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                 = true
    }

}

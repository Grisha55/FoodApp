//
//  LoginAndSignUpVC.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit

class LoginAndSignUpVC: UIViewController {

    // MARK: - Properties
    private let titleLabel = UILabel()
    private let smallStackView = UIStackView()
    private let bigStackView = UIStackView()
    private let logInButton = UIButton()
    private let questionLabel = UILabel()
    private let signInButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureTitleLabel()
        configureLogInButton()
        configureQuestionLabel()
        configureSignInButton()
        configureSmallStackView()
        configureBigStackView()
        
        setBigStackViewConstraints()
        setSmallStackViewConstraints()
        setTitleLabelConstraints()
        setLogInButtonConstraints()
        setSignInButtonConstraints()
    }
    
    
    // MARK: - Methods
    
    private func configureBigStackView() {
        view.addSubview(bigStackView)
        bigStackView.axis = .vertical
        bigStackView.alignment = .center
        bigStackView.distribution = .fill
        bigStackView.spacing = 20
        
        bigStackView.addArrangedSubview(logInButton)
        bigStackView.addArrangedSubview(smallStackView)
    }
    
    private func configureSmallStackView() {
        smallStackView.axis = .vertical
        smallStackView.alignment = .center
        smallStackView.distribution = .fillEqually
        smallStackView.spacing = 3
        
        smallStackView.addArrangedSubview(questionLabel)
        smallStackView.addArrangedSubview(signInButton)
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "Food App"
        titleLabel.textColor = .black
        titleLabel.font = titleLabel.font.withSize(60)
    }
    
    private func configureLogInButton() {
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.black, for: .normal)
        logInButton.titleLabel?.font = titleLabel.font.withSize(25)
        logInButton.backgroundColor = .orange
        logInButton.layer.cornerRadius = 8
        logInButton.addTarget(self, action: #selector(buttonLogInAction), for: .touchUpInside)
    }
    
    @objc func buttonLogInAction() {
        print("touched!")
    }
    
    private func configureQuestionLabel() {
        questionLabel.text = "Don't have an account?"
        questionLabel.textColor = .black
        questionLabel.font = titleLabel.font.withSize(16)
    }
    
    private func configureSignInButton() {
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.titleLabel?.font = titleLabel.font.withSize(25)
        signInButton.backgroundColor = .white
        signInButton.layer.cornerRadius = 8
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.black.cgColor
        signInButton.addTarget(self, action: #selector(buttonSignInAction), for: .touchUpInside)
    }
    
    @objc func buttonSignInAction() {
        print("touched!!")
    }

    private func setLogInButtonConstraints() {
        logInButton.translatesAutoresizingMaskIntoConstraints                                               = false
        logInButton.trailingAnchor.constraint(equalTo: bigStackView.trailingAnchor, constant: -40).isActive = true
    }
    
    private func setSignInButtonConstraints() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.trailingAnchor.constraint(equalTo: smallStackView.trailingAnchor, constant: -40).isActive = true
    }
    
    private func setSmallStackViewConstraints() {
        smallStackView.translatesAutoresizingMaskIntoConstraints                                = false
        smallStackView.trailingAnchor.constraint(equalTo: bigStackView.trailingAnchor).isActive = true
    }
    
    private func setBigStackViewConstraints() {
        bigStackView.translatesAutoresizingMaskIntoConstraints                                       = false
        bigStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        bigStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                  = true
        bigStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 200).isActive  = true
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints                             = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive        = true
    }
    
}

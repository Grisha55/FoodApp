//
//  LoginAndSignUpPresenter.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit

class LoginAndSignUpPresenter {
    
    func transitionToLoginVC(nv: UINavigationController) {
        nv.pushViewController(LoginVC(), animated: true)
    }
    
    func transitionToSignUpVC(nv: UINavigationController) {
        nv.pushViewController(SignUpVC(), animated: true)
    }
    
}

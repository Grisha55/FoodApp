//
//  FirebaseStore.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit
import Firebase

class FirebaseStore {
    
    func signInWith(email: String, password: String, nv: UINavigationController, vc: UIViewController) {
        
        Firebase.Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            guard authResult != nil, error == nil else {
                // TODO: Make alert
                Alerts().loginAlert(controller: vc)
                return
            }
            nv.pushViewController(TabBarVC(), animated: true)
        }
    }
    
    func existUser(name: String, login: String, password: String, nv: UINavigationController, vc: UIViewController) {
        DatabaseManager.shared.userExists(name: name, email: login, password: password) { exist in
            Auth.auth().fetchSignInMethods(forEmail: login) { providers, error in
                if error != nil {
                    print(error?.localizedDescription as Any)
                }
                if providers != nil {
                    // Make Alert
                    Alerts().loginAlert(controller: vc)
                    return
                }
            }
            FirebaseAuth.Auth.auth().createUser(withEmail: login, password: password) { authResult, error in
                
                guard authResult != nil, error == nil else {
                    return
                }
                nv.pushViewController(TabBarVC(), animated: true)
            }
        }
    }
    
    func exitAction() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}

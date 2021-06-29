//
//  Alerts.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 29.06.2021.
//

import UIKit

class Alerts {
    func loginAlert(controller: UIViewController) {
        let alertVC = UIAlertController(title: "Error", message: "Incorrect Login or Password", preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertVC.addAction(action)
        controller.present(alertVC, animated: true, completion: nil)
    }
}

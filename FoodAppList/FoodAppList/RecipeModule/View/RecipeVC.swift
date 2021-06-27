//
//  RecipeVC.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit

class RecipeVC: UIViewController {

    // MARK: - Properties
    private var foodPhoto = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureFoodPhoto()
        setFoodPhotoConstraints()
    }

    private func configureFoodPhoto() {
        view.addSubview(foodPhoto)
        foodPhoto.layer.cornerRadius = 20
        foodPhoto.clipsToBounds = true
        foodPhoto.backgroundColor = .systemRed
    }
    
    private func setFoodPhotoConstraints() {
        foodPhoto.translatesAutoresizingMaskIntoConstraints                        = false
        foodPhoto.topAnchor.constraint(equalTo: view.topAnchor).isActive           = true
        foodPhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        foodPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive   = true
        foodPhoto.heightAnchor.constraint(equalToConstant: 300).isActive           = true
    }
    
}

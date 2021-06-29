//
//  RecipeVC.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit
import SDWebImage

class RecipeVC: UIViewController {

    // MARK: - Properties
    private var foodPhoto = UIImageView()
    private let minutesLabel = UILabel()
    private var minutesCount = "30"
    private var caloriesLabel = UILabel()
    private let peopleLabel = UILabel()
    private var peopleCount = "3"
    private let stackViewForParameters = UIStackView()
    private let recipeTextView = UITextView()
    static var hit = Hit()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        title = RecipeVC.hit.recipe?.label
        setupMinutes()
        setupPeopleCountLabel()
        
        configureFoodPhoto()
        configureMinutesLabel()
        configureCaloriesLabel()
        configurePeopleLabel()
        configureStackViewForParameters()
        configureRecipeTextView()
        
        setFoodPhotoConstraints()
        setRecipeTextViewConstraints()
        setStackViewForParametersConstraints()
        
        setupFoodPhoto()
        setupCaloriesLabel()
        setupRecipeTextView()
        setupNavigationBar()
    }
    
    // MARK: Methods
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(buttonSaveAction))
    }
    
    @objc func buttonSaveAction() {
        let recipeModel = RecipeModel()
        guard let title = RecipeVC.hit.recipe?.label else { return }
        recipeModel.title = title
        guard let photoString = RecipeVC.hit.recipe?.image else { return }
        recipeModel.photoString = photoString
        RealmManager().saveToRealm(recipeModel: recipeModel)
    }
    
    private func setupRecipeTextView() {
        guard let ingredients = RecipeVC.hit.recipe?.ingredientLines else { return }
        var recipe = ""
        ingredients.forEach { ingredient in
            recipe += "\n - \(ingredient)"
        }
        recipeTextView.text = recipe
        recipeTextView.backgroundColor = .systemYellow
        recipeTextView.showsVerticalScrollIndicator = false
    }
    
    private func setupPeopleCountLabel() {
        peopleCount = String(Int(RecipeVC.hit.recipe?.yield ?? 0))
    }
    
    private func setupCaloriesLabel() {
        guard let calories = RecipeVC.hit.recipe?.calories else { return }
        caloriesLabel.text = String("\(Int(calories)) calories")
    }
    
    private func setupMinutes() {
        guard let minutes = RecipeVC.hit.recipe?.totalTime else { return }
        minutesCount = String(minutes)
    }
    
    private func setupFoodPhoto() {
        guard let urlString = RecipeVC.hit.recipe?.image else { return }
        foodPhoto.sd_setImage(with: URL(string: urlString), completed: .none)
    }
    
    private func configureFoodPhoto() {
        view.addSubview(foodPhoto)
        foodPhoto.layer.cornerRadius = 20
        foodPhoto.clipsToBounds = true
    }
    
    private func configureRecipeTextView() {
        view.addSubview(recipeTextView)
        recipeTextView.textColor = .black
        recipeTextView.isEditable = false
        recipeTextView.font = .systemFont(ofSize: 20)
    }
    
    private func configureStackViewForParameters() {
        view.addSubview(stackViewForParameters)
        stackViewForParameters.axis = .horizontal
        stackViewForParameters.alignment = .top
        stackViewForParameters.distribution = .fillEqually
        stackViewForParameters.spacing = 20
        
        stackViewForParameters.addArrangedSubview(minutesLabel)
        stackViewForParameters.addArrangedSubview(caloriesLabel)
        stackViewForParameters.addArrangedSubview(peopleLabel)
    }
    
    private func configureMinutesLabel() {
        minutesLabel.text = "\(minutesCount) minutes"
        minutesLabel.textColor = .black
        minutesLabel.font = minutesLabel.font.withSize(20)
        minutesLabel.textAlignment = .center
    }
    
    private func configureCaloriesLabel() {
        caloriesLabel.text = "N/F"
        caloriesLabel.textColor = .black
        caloriesLabel.font = caloriesLabel.font.withSize(20)
        caloriesLabel.textAlignment = .center
    }
    
    private func configurePeopleLabel() {
        peopleLabel.text = "\(peopleCount) people"
        peopleLabel.textColor = .black
        peopleLabel.font = peopleLabel.font.withSize(20)
        peopleLabel.textAlignment = .center
    }
    
    private func setFoodPhotoConstraints() {
        foodPhoto.translatesAutoresizingMaskIntoConstraints                             = false
        foodPhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        foodPhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive      = true
        foodPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive        = true
        foodPhoto.heightAnchor.constraint(equalToConstant: 250).isActive                = true
    }
    
    private func setRecipeTextViewConstraints() {
        recipeTextView.translatesAutoresizingMaskIntoConstraints                                                 = false
        recipeTextView.topAnchor.constraint(equalTo: stackViewForParameters.bottomAnchor, constant: 30).isActive = true
        recipeTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive           = true
        recipeTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive              = true
        recipeTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive                              = true
    }
    
    private func setStackViewForParametersConstraints() {
        stackViewForParameters.translatesAutoresizingMaskIntoConstraints                                   = false
        stackViewForParameters.topAnchor.constraint(equalTo: foodPhoto.bottomAnchor, constant: 1).isActive = true
        stackViewForParameters.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive              = true
        stackViewForParameters.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive            = true
    }
    
}

//
//  RecipeVC.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit
import SDWebImage
import RealmSwift

class RecipeVC: UIViewController {

    // MARK: - Properties
    private var foodPhoto = UIImageView()
    private var titleLabel = UILabel()
    private let minutesLabel = UILabel()
    private var minutesCount = "30"
    private var caloriesLabel = UILabel()
    private let peopleLabel = UILabel()
    private var peopleCount = "3"
    private var ingredientsLabel = UILabel()
    private let stackViewForParameters = UIStackView()
    private let titleStackView = UIStackView()
    private let recipeTextView = UITextView()
    private let ingredientsStackView = UIStackView()
    private let mainStackView = UIStackView()
    private let healthLabel = UILabel()
    private let healthTextView = UITextView()
    private let scrollView = UIScrollView()
    private let healthStackView = UIStackView()
    static var hit = Hit()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        setupMinutes()
        setupPeopleCountLabel()
        
        configureFoodPhoto()
        configureMinutesLabel()
        configureCaloriesLabel()
        configurePeopleLabel()
        configureStackViewForParameters()
        configureRecipeTextView()
        configureTitleLabel()
        configureTitleStackView()
        configureIngredientsLabel()
        configureIngredientsStackView()
        configureMainStackView()
        configureHealthLabel()
        configureHealthTextView()
        configureHealthStackView()
        
        setFoodPhotoConstraints()
        setRecipeTextViewConstraints()
        setMainStackViewConstraints()
        setScrollViewConstraints()
        setTitleLabelConstraints()
        setStackViewForParametersConstraints()
        setHealthTextViewConstraints()
        
        setupFoodPhoto()
        setupCaloriesLabel()
        setupRecipeTextView()
        setupNavigationBar()
        setupTitleLabel()
        setupHealthTextView()
        
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
    
    private func configureHealthStackView() {
        healthStackView.axis = .vertical
        healthStackView.alignment = .center
        healthStackView.distribution = .fillProportionally
        healthStackView.spacing = 0
        
        healthStackView.addArrangedSubview(healthLabel)
        healthStackView.addArrangedSubview(healthTextView)
    }
    
    private func configureHealthTextView() {
        healthTextView.textColor = .black
        healthTextView.isUserInteractionEnabled = false
        healthTextView.font = .systemFont(ofSize: 20)
        healthTextView.backgroundColor = .white
    }
    
    private func configureHealthLabel() {
        healthLabel.text = "Health"
        healthLabel.font = healthLabel.font.withSize(20)
        healthLabel.textAlignment = .center
        healthLabel.textColor = .black
    }
    
    private func configureMainStackView() {
        scrollView.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.distribution = .equalSpacing
        mainStackView.spacing = 20
        
        mainStackView.addArrangedSubview(foodPhoto)
        mainStackView.addArrangedSubview(titleStackView)
        mainStackView.addArrangedSubview(ingredientsStackView)
        mainStackView.addArrangedSubview(healthStackView)
    }
    
    private func configureIngredientsStackView() {
        ingredientsStackView.axis = .vertical
        ingredientsStackView.alignment = .center
        ingredientsStackView.distribution = .fillProportionally
        ingredientsStackView.spacing = 0
        
        ingredientsStackView.addArrangedSubview(ingredientsLabel)
        ingredientsStackView.addArrangedSubview(recipeTextView)
    }
    
    private func configureIngredientsLabel() {
        ingredientsLabel.text = "INGREDIENTS"
        ingredientsLabel.textColor = .black
        ingredientsLabel.font = ingredientsLabel.font.withSize(20)
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "Label for title"
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .center
        titleLabel.font = titleLabel.font.withSize(25)
        titleLabel.textColor = .black
    }
    
    private func configureTitleStackView() {
        titleStackView.axis = .vertical
        titleStackView.alignment = .center
        titleStackView.distribution = .fillProportionally
        titleStackView.spacing = 10
        
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(stackViewForParameters)
    }
    
    private func setupTitleLabel() {
        guard let title = RecipeVC.hit.recipe?.label else { return }
        titleLabel.text = title
    }
    
    private func setupHealthTextView() {
        guard let dietString = RecipeVC.hit.recipe?.healthLabels else { return }
        var dietStr = ""
        dietString.forEach { diet in
            dietStr += "\n ◦ \(diet)"
        }
        healthTextView.text = dietStr
        healthTextView.backgroundColor = .white
        healthTextView.showsVerticalScrollIndicator = false
    }
    
    private func setupRecipeTextView() {
        guard let ingredients = RecipeVC.hit.recipe?.ingredientLines else { return }
        var recipe = ""
        ingredients.forEach { ingredient in
            recipe += "\n ● \(ingredient)"
        }
        recipeTextView.text = recipe
        recipeTextView.backgroundColor = .white
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
        foodPhoto.clipsToBounds = true
    }
    
    private func configureRecipeTextView() {
        recipeTextView.textColor = .black
        recipeTextView.isEditable = false
        recipeTextView.font = .systemFont(ofSize: 17)
    }
    
    private func configureStackViewForParameters() {
        stackViewForParameters.axis = .horizontal
        stackViewForParameters.alignment = .center
        stackViewForParameters.distribution = .fillProportionally
        stackViewForParameters.spacing = 20
        
        stackViewForParameters.addArrangedSubview(minutesLabel)
        stackViewForParameters.addArrangedSubview(caloriesLabel)
        stackViewForParameters.addArrangedSubview(peopleLabel)
    }
    
    private func configureMinutesLabel() {
        minutesLabel.text = "\(minutesCount) minutes"
        minutesLabel.textColor = .gray
        minutesLabel.font = minutesLabel.font.withSize(20)
        minutesLabel.textAlignment = .center
    }
    
    private func configureCaloriesLabel() {
        caloriesLabel.text = "N/F"
        caloriesLabel.textColor = .gray
        caloriesLabel.font = caloriesLabel.font.withSize(20)
        caloriesLabel.textAlignment = .center
    }
    
    private func configurePeopleLabel() {
        peopleLabel.text = "\(peopleCount) people"
        peopleLabel.textColor = .gray
        peopleLabel.font = peopleLabel.font.withSize(20)
        peopleLabel.textAlignment = .center
    }
    
    private func setScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.pin(to: view)
    }
    
    private func setHealthTextViewConstraints() {
        healthTextView.translatesAutoresizingMaskIntoConstraints                           = false
        healthTextView.heightAnchor.constraint(equalToConstant: 300).isActive              = true
        healthTextView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
    }
    
    private func setStackViewForParametersConstraints() {
        stackViewForParameters.translatesAutoresizingMaskIntoConstraints                  = false
        stackViewForParameters.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        stackViewForParameters.heightAnchor.constraint(equalToConstant: 20).isActive      = true
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    private func setMainStackViewConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints                                          = false
        mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive                       = true
        mainStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive             = true
        mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive               = true
        mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -200).isActive = true
    }
    
    private func setRecipeTextViewConstraints() {
        recipeTextView.translatesAutoresizingMaskIntoConstraints                           = false
        recipeTextView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        recipeTextView.heightAnchor.constraint(equalToConstant: 300).isActive              = true
    }
    
    private func setFoodPhotoConstraints() {
        foodPhoto.translatesAutoresizingMaskIntoConstraints                             = false
        foodPhoto.heightAnchor.constraint(equalToConstant: 250).isActive                = true
        foodPhoto.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive   = true
    }
    
}

//
//  SearchCell.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit

class SearchCell: UITableViewCell {

    // MARK: - Properties
    private let foodTitleLabel = UILabel()
    private var foodPhotoImageView = UIImageView()
    private let caloriesLabel = UILabel()
    private var caloriesImageView = UIImageView()
    private let caloriesStackView = UIStackView()
    private let totalTimeLabel = UILabel()
    private var totalTimeImageView = UIImageView()
    private let timeStackView = UIStackView()
    private let totalWeightLabel = UILabel()
    private var totalWeightImageView = UIImageView()
    private let weightStackView = UIStackView()
    private let stateStackView = UIStackView()
    private var backView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        addSubview(backView)
        
        configureBackView()
        configureFoodTitleLabel()
        configureFoodPhotoImageView()
        configureCaloriesLabel()
        configureTotalTimeLabel()
        configureTotalWeightLabel()
        configureStateStackView()
        configureCaloriesImageView()
        configureCaloriesStackView()
        configureTotalTimeImageView()
        configureTimeStackView()
        configureTotalWeightImageView()
        configureWeightStackView()
        
        setBackViewConstraints()
        setFoodTitleLabelConstraints()
        setFoodPhotoImageViewConstraints()
        setStateStackViewConstraints()
        setCaloriesImageViewConstraints()
        setTotalTimeImageViewConstraints()
        setTotalWeightImageViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Methods
    func configureCell(title: String, foodPhotoURL: String, calories: String, totalTime: String, totalWeight: String) {
        self.foodTitleLabel.text = title
        self.foodPhotoImageView.sd_setImage(with: URL(string: foodPhotoURL), completed: .none)
        self.caloriesLabel.text = calories
        self.totalTimeLabel.text = totalTime
        self.totalWeightLabel.text = totalWeight
    }
    
    private func configureWeightStackView() {
        weightStackView.axis = .horizontal
        weightStackView.alignment = .fill
        weightStackView.distribution = .fill
        
        weightStackView.addArrangedSubview(totalWeightImageView)
        weightStackView.addArrangedSubview(totalWeightLabel)
    }
    
    private func configureTotalWeightImageView() {
        totalWeightImageView.contentMode = .scaleAspectFill
        totalWeightImageView.image = UIImage(named: "weight")
    }
    
    private func configureTimeStackView() {
        timeStackView.axis = .horizontal
        timeStackView.alignment = .fill
        timeStackView.spacing = 1
        timeStackView.distribution = .fill
        
        timeStackView.addArrangedSubview(totalTimeImageView)
        timeStackView.addArrangedSubview(totalTimeLabel)
    }
    
    private func configureTotalTimeImageView() {
        totalTimeImageView.contentMode = .scaleAspectFill
        totalTimeImageView.image = UIImage(named: "history")
    }
    
    private func configureCaloriesStackView() {
        caloriesStackView.axis = .horizontal
        caloriesStackView.alignment = .fill
        caloriesStackView.spacing = 1
        caloriesStackView.distribution = .fill
        
        caloriesStackView.addArrangedSubview(caloriesImageView)
        caloriesStackView.addArrangedSubview(caloriesLabel)
    }
    
    private func configureCaloriesImageView() {
        caloriesImageView.contentMode = .scaleAspectFill
        caloriesImageView.image = UIImage(named: "food")
    }
    
    private func configureTotalWeightLabel() {
        totalWeightLabel.textColor = .gray
        totalWeightLabel.numberOfLines = 0
        totalWeightLabel.textAlignment = .center
    }
    
    private func configureTotalTimeLabel() {
        totalTimeLabel.textColor = .gray
        totalTimeLabel.numberOfLines = 0
        totalTimeLabel.textAlignment = .center
    }
    
    private func configureCaloriesLabel() {
        caloriesLabel.textColor = .gray
        caloriesLabel.numberOfLines = 0
        caloriesLabel.textAlignment = .center
    }
    
    private func configureStateStackView() {
        stateStackView.axis = .horizontal
        stateStackView.alignment = .trailing
        stateStackView.spacing = 10
        stateStackView.distribution = .fillEqually
        
        stateStackView.addArrangedSubview(caloriesStackView)
        stateStackView.addArrangedSubview(timeStackView)
        stateStackView.addArrangedSubview(weightStackView)
    }
    
    private func configureBackView() {
        backView.backgroundColor = .white
        backView.layer.shadowRadius = 5
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOpacity = 1.0
        backView.addSubview(foodTitleLabel)
        backView.addSubview(foodPhotoImageView)
        backView.addSubview(stateStackView)
        backView.addSubview(stateStackView)
    }
    
    private func configureFoodPhotoImageView() {
        foodPhotoImageView.clipsToBounds = true
        foodPhotoImageView.backgroundColor = .white
        foodPhotoImageView.contentMode = .scaleToFill
    }
    
    private func configureFoodTitleLabel() {
        foodTitleLabel.textAlignment = .center
        foodTitleLabel.numberOfLines = 1
        foodTitleLabel.adjustsFontSizeToFitWidth = true
        foodTitleLabel.font = foodTitleLabel.font.withSize(15)
    }
    
    private func setTotalWeightImageViewConstraints() {
        totalWeightImageView.translatesAutoresizingMaskIntoConstraints             = false
        totalWeightImageView.widthAnchor.constraint(equalToConstant: 20).isActive  = true
        totalWeightImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setTotalTimeImageViewConstraints() {
        totalTimeImageView.translatesAutoresizingMaskIntoConstraints             = false
        totalTimeImageView.widthAnchor.constraint(equalToConstant: 20).isActive  = true
        totalTimeImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setCaloriesImageViewConstraints() {
        caloriesImageView.translatesAutoresizingMaskIntoConstraints             = false
        caloriesImageView.widthAnchor.constraint(equalToConstant: 20).isActive  = true
        caloriesImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setStateStackViewConstraints() {
        stateStackView.translatesAutoresizingMaskIntoConstraints                                      = false
        stateStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor).isActive           = true
        stateStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor).isActive             = true
        stateStackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5).isActive = true
    }
    
    private func setFoodPhotoImageViewConstraints() {
        foodPhotoImageView.translatesAutoresizingMaskIntoConstraints                                  = false
        foodPhotoImageView.topAnchor.constraint(equalTo: backView.topAnchor).isActive                 = true
        foodPhotoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive    = true
        foodPhotoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        foodPhotoImageView.heightAnchor.constraint(equalToConstant: 150).isActive                     = true
    }
    
    private func setFoodTitleLabelConstraints() {
        foodTitleLabel.translatesAutoresizingMaskIntoConstraints                                             = false
        foodTitleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor).isActive                    = true
        foodTitleLabel.topAnchor.constraint(equalTo: foodPhotoImageView.bottomAnchor, constant: 10).isActive = true
        foodTitleLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor).isActive                  = true
    }
    
    private func setBackViewConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints                                  = false
        backView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive            = true
        backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive     = true
        backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive    = true
    }
    
    internal override func prepareForReuse() {
        super.prepareForReuse()
        self.foodPhotoImageView.image = nil
        self.foodTitleLabel.text = nil
        self.caloriesLabel.text = nil
        self.totalWeightLabel.text = nil
        self.totalTimeLabel.text = nil
    }
    
}

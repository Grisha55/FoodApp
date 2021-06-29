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
    private let healthLabel = UILabel()
    private var backView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .systemYellow
        addSubview(backView)
        
        configureBackView()
        configureFoodTitleLabel()
        configureFoodPhotoImageView()
        configureHealthLabel()
        
        setBackViewConstraints()
        setFoodTitleLabelConstraints()
        setFoodPhotoImageViewConstraints()
        setHealthLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Methods
    func configureCell(title: String, healthLabel: String, foodPhotoURL: String) {
        self.foodTitleLabel.text = title
        self.healthLabel.text = healthLabel
        self.foodPhotoImageView.sd_setImage(with: URL(string: foodPhotoURL), completed: .none)
    }
    
    private func configureBackView() {
        backView.backgroundColor = .systemYellow
        backView.addSubview(foodTitleLabel)
        backView.addSubview(foodPhotoImageView)
        backView.addSubview(healthLabel)
    }
    
    private func configureHealthLabel() {
        healthLabel.textColor = .black
        healthLabel.font = healthLabel.font.withSize(20)
        healthLabel.numberOfLines = 0
    }
    
    private func configureFoodPhotoImageView() {
        foodPhotoImageView.clipsToBounds = true
        foodPhotoImageView.backgroundColor = .yellow
    }
    
    private func configureFoodTitleLabel() {
        foodTitleLabel.textAlignment = .center
        foodTitleLabel.numberOfLines = 0
        foodTitleLabel.adjustsFontSizeToFitWidth = true
        foodTitleLabel.font = foodTitleLabel.font.withSize(20)
    }
    
    private func setHealthLabelConstraints() {
        healthLabel.translatesAutoresizingMaskIntoConstraints                                                  = false
        healthLabel.topAnchor.constraint(equalTo: foodTitleLabel.bottomAnchor, constant: 10).isActive          = true
        healthLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor).isActive                         = true
        healthLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor).isActive                           = true
        healthLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor).isActive                       = true
    }
    
    private func setFoodPhotoImageViewConstraints() {
        foodPhotoImageView.translatesAutoresizingMaskIntoConstraints                            = false
        foodPhotoImageView.topAnchor.constraint(equalTo: backView.topAnchor).isActive           = true
        foodPhotoImageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor).isActive = true
        foodPhotoImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor).isActive   = true
    }
    
    private func setFoodTitleLabelConstraints() {
        foodTitleLabel.translatesAutoresizingMaskIntoConstraints                                                      = false
        foodTitleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor).isActive                             = true
        foodTitleLabel.topAnchor.constraint(equalTo: foodPhotoImageView.bottomAnchor, constant: 10).isActive          = true
        foodTitleLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor).isActive                           = true
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
        self.backView = UIView()
        self.foodPhotoImageView.image = nil
        self.foodTitleLabel.text = nil
        self.healthLabel.text = nil
    }
    
}

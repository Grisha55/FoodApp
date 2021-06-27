//
//  SearchCell.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit

class SearchCell: UITableViewCell {

    // MARK: - Properties
    private var foodTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(foodTitleLabel)
        
        configureFoodTitleLabel()
        setFoodTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(title: String) {
        self.foodTitleLabel.text = title
    }
    
    private func configureFoodTitleLabel() {
        foodTitleLabel.textAlignment = .center
        foodTitleLabel.numberOfLines = 1
        foodTitleLabel.adjustsFontSizeToFitWidth = true
        foodTitleLabel.text = "some text"
    }
    
    private func setFoodTitleLabelConstraints() {
        foodTitleLabel.translatesAutoresizingMaskIntoConstraints                       = false
        foodTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive       = true
        foodTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    }
    
}

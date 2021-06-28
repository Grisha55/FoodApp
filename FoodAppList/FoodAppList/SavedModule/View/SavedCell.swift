//
//  SavedCell.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 28.06.2021.
//

import UIKit

class SavedCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

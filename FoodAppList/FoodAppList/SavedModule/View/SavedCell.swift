//
//  SavedCell.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 28.06.2021.
//

import UIKit

class SavedCell: UICollectionViewCell {
    
    // MARK: - Properties
    private let photoImageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(photoImageView)
        addSubview(titleLabel)
        
        configurePhotoImageView()
        configureTitleLabel()
        
        setPhotoImageViewConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func configureCell(photoString: String, title: String) {
        self.photoImageView.sd_setImage(with: URL(string: photoString), completed: .none)
        self.titleLabel.text = title
    }
    
    private func configureTitleLabel() {
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.text = "There will be the title"
    }
    
    private func configurePhotoImageView() {
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = 10
        photoImageView.backgroundColor = .yellow
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints                                         = false
        titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive           = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive        = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive        = true
    }
    
    private func setPhotoImageViewConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints                              = false
        photoImageView.topAnchor.constraint(equalTo: topAnchor).isActive                      = true
        photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive            = true
        photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive              = true
    }
}

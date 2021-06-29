//
//  SavedCell.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 28.06.2021.
//

import UIKit
import Gemini

protocol SavedCellDelegate: AnyObject {
    func deleteAction(cell: SavedCell)
}

class SavedCell: GeminiCell {
    
    // MARK: - Properties
    private let photoImageView = UIImageView()
    private let titleLabel = UILabel()
    private var deleteButton = UIButton()
    private var visualView = UIVisualEffectView()
    weak var savedCellDelegate: SavedCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(photoImageView)
        addSubview(titleLabel)
        
        configurePhotoImageView()
        configureTitleLabel()
        configureDeleteButton()
        configureVisualView()
        
        setPhotoImageViewConstraints()
        setTitleLabelConstraints()
        setVisualViewConstraints()
        setDeleteButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func configureCell(photoString: String, title: String) {
        self.photoImageView.sd_setImage(with: URL(string: photoString), completed: .none)
        self.titleLabel.text = title
    }
    
    private func configureVisualView() {
        visualView.contentView.addSubview(deleteButton)
        visualView.contentView.isUserInteractionEnabled = true
        visualView.layer.cornerRadius = visualView.bounds.width / 2.0
        visualView.layer.masksToBounds = true
        visualView.backgroundColor = .white
    }
    
    private func configureDeleteButton() {
        let trashImage = UIImage(named: "Close")
        deleteButton.setImage(trashImage, for: .normal)
        deleteButton.addTarget(self, action: #selector(buttonDeleteAction), for: .touchUpInside)
    }
    
    @objc func buttonDeleteAction() {
        savedCellDelegate?.deleteAction(cell: self)
    }
    
    private func configureTitleLabel() {
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.text = "There will be the title"
    }
    
    private func configurePhotoImageView() {
        photoImageView.addSubview(visualView)
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = 10
        photoImageView.isUserInteractionEnabled = true
    }
    
    private func setVisualViewConstraints() {
        visualView.translatesAutoresizingMaskIntoConstraints                                             = false
        visualView.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: 8).isActive = true
        visualView.topAnchor.constraint(equalTo: photoImageView.topAnchor, constant: 8).isActive         = true
        visualView.widthAnchor.constraint(equalToConstant: 30).isActive                                  = true
        visualView.heightAnchor.constraint(equalToConstant: 30).isActive                                 = true
    }
    
    private func setDeleteButtonConstraints() {
        deleteButton.translatesAutoresizingMaskIntoConstraints                                                        = false
        deleteButton.trailingAnchor.constraint(equalTo: visualView.contentView.trailingAnchor, constant: -4).isActive = true
        deleteButton.leadingAnchor.constraint(equalTo: visualView.contentView.leadingAnchor, constant: 4).isActive    = true
        deleteButton.topAnchor.constraint(equalTo: visualView.contentView.topAnchor, constant: 4).isActive            = true
        deleteButton.bottomAnchor.constraint(equalTo: visualView.contentView.bottomAnchor, constant: -4).isActive     = true
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints                                                     = false
        titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10).isActive             = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive                       = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive                    = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive                        = true
    }
    
    private func setPhotoImageViewConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints                   = false
        photoImageView.topAnchor.constraint(equalTo: topAnchor).isActive           = true
        photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive   = true
    }
    
    internal override func prepareForReuse() {
        super.prepareForReuse()
        self.photoImageView.image = nil
        self.titleLabel.text = nil
        self.deleteButton = UIButton()
        self.visualView = UIVisualEffectView()
    }
    
}

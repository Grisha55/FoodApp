//
//  UIView+Ext.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit

extension UIView {
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints                             = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive           = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive     = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive   = true
    }
}

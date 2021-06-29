//
//  RecipeModel.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 28.06.2021.
//

import Foundation
import RealmSwift

class RecipeModel: Object, Codable {
    @objc dynamic var photoString: String = ""
    @objc dynamic var title: String = ""
}

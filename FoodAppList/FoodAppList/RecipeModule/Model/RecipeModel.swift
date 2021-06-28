//
//  RecipeModel.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 28.06.2021.
//

import Foundation
import RealmSwift

@objc
class RecipeModel: Object, Codable {
    dynamic var photoString: String = ""
    dynamic var title: String = ""
}

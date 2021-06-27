//
//  FoodModel.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import Foundation

// MARK: - Food
struct Food: Codable {
    var hits: [Hit]?
}

// MARK: - Hit
struct Hit: Codable {
    var recipe: Recipe?
}

// MARK: - Recipe
struct Recipe: Codable {
    var uri, label, image, source: String?
    var url: String?
    var ingredientLines: [String]?
    var ingredients: [Ingredient]?
    var calories, totalWeight: Double?
}

// MARK: - Ingredient
struct Ingredient: Codable {
    var text: String?
    var quantity: Double?
    var measure, food: String?
    var weight: Double?
    var foodID: String?

    enum CodingKeys: String, CodingKey {
        case text, quantity, measure, food, weight
    }
}

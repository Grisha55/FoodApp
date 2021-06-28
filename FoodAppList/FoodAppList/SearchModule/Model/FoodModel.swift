//
//  FoodModel.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import Foundation

// MARK: - Food
struct Food: Codable {
    var from, to, count: Int?
    var links: Links?
    var hits: [Hit]?

    enum CodingKeys: String, CodingKey {
        case from, to, count
        case links = "_links"
        case hits
    }
}

// MARK: - Hit
struct Hit: Codable {
    var recipe: Recipe?
    var links: Links?

    enum CodingKeys: String, CodingKey {
        case recipe
        case links = "_links"
    }
}

// MARK: - Links
struct Links: Codable {
    var linksSelf, next: Next?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case next
    }
}

// MARK: - Next
struct Next: Codable {
    var href, title: String?
}

// MARK: - Recipe
struct Recipe: Codable {
    var uri, label, image, source: String?
    var url, shareAs: String?
    var yield: Double?
    var dietLabels, healthLabels, cautions, ingredientLines: [String]?
    var ingredients: [Ingredient]?
    var calories, totalWeight: Double?
    var totalTime: Int?
    var cuisineType, mealType, dishType: [String]?
    var totalNutrients, totalDaily: TotalDaily?
    var digest: [Digest]?
}

// MARK: - Digest
struct Digest: Codable {
    var label, tag, schemaOrgTag: String?
    var total: Double?
    var hasRDI: Bool?
    var daily: Double?
    var unit: String?
    var sub: TotalDaily?
}

// MARK: - TotalDaily
struct TotalDaily: Codable {
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
        case foodID = "foodId"
    }
}


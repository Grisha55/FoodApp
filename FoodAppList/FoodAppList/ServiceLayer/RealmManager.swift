//
//  RealmManager.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 28.06.2021.
//

import UIKit
import RealmSwift
import Gemini

class RealmManager {
    
    func saveToRealm(recipeModel: RecipeModel) {
        guard let realm = try? Realm() else { return }
        realm.beginWrite()
        realm.add(recipeModel.self, update: .all)
        try? realm.commitWrite()
    }
    
    func deleteFromRealm(collectionView: GeminiCollectionView, recipeModel: RecipeModel) {
        guard let realm = try? Realm() else { return }
        realm.beginWrite()
        realm.delete(recipeModel)
        collectionView.reloadData()
        try? realm.commitWrite()
    }
    
    func getDataFromRealm(collectionView: UICollectionView) -> Results<RecipeModel>? {
        guard let realm = try? Realm() else { return nil }
        let recipies = realm.objects(RecipeModel.self)
        collectionView.reloadData()
        return recipies
    }
    
}

//
//  RealmManager.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 28.06.2021.
//

import UIKit
import RealmSwift

class RealmManager {
    
    func saveToRealm(recipeModel: RecipeModel) {
        guard let realm = try? Realm() else { return }
        realm.beginWrite()
        realm.add(recipeModel.self)
        try? realm.commitWrite()
    }
    
    func deleteFromRealm(recipeModel: RecipeModel) {
        guard let realm = try? Realm() else { return }
        realm.beginWrite()
        realm.delete(recipeModel)
        try? realm.commitWrite()
    }
    
    func getDataFromRealm(collectionView: UICollectionView) -> Results<RecipeModel>? {
        guard let realm = try? Realm() else { return nil }
        let recipies = realm.objects(RecipeModel.self)
        collectionView.reloadData()
        return recipies
    }
    
}

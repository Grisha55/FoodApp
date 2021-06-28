//
//  SavedVC.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit
import RealmSwift

class SavedVC: UIViewController {

    // MARK: - Properties
    private var collectionView: UICollectionView?
    private var recipies: Results<RecipeModel>?
    private let savedCell = "recipeCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    // MARK: - Methods
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = .white
        guard let collectionView = collectionView else { return }
        collectionView.register(SavedCell.self, forCellWithReuseIdentifier: savedCell)
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }

}

extension SavedVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //guard let recipies = recipies else { return 0 }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: savedCell, for: indexPath) as? SavedCell else { return UICollectionViewCell() }
        return cell
    }
}

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let collectionView = collectionView else { return }
        self.recipies = RealmManager().getDataFromRealm(collectionView: collectionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureCollectionView()
    }
    
    // MARK: - Methods
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width - 20, height: view.frame.height - 250)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = .white
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.isDirectionalLockEnabled = false
        collectionView?.isPagingEnabled = true
        
        guard let collectionView = collectionView else { return }
        collectionView.register(SavedCell.self, forCellWithReuseIdentifier: savedCell)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
    
}

//MARK: - UICollectionViewDelegate
extension SavedVC: UICollectionViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.collectionView?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.collectionView?.transform = .identity
        }
    }
}

// MARK: - UICollectionViewDataSource
extension SavedVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let recipies = recipies else { return 0 }
        return recipies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: savedCell, for: indexPath) as? SavedCell else { return UICollectionViewCell() }
        guard let recipies = recipies else { return UICollectionViewCell() }
        let recipe = recipies[indexPath.row]
        cell.configureCell(photoString: recipe.photoString, title: recipe.title)
        return cell
    }
}

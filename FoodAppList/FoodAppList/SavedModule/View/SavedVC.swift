//
//  SavedVC.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit
import RealmSwift
import Gemini

class SavedVC: UIViewController {

    // MARK: - Properties
    private var collectionView: GeminiCollectionView?
    private var recipies: Results<RecipeModel>?
    private let savedCell = "recipeCell"
    private var tappedIndexPath: IndexPath?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let collectionView = collectionView else { return }
        self.recipies = RealmManager().getDataFromRealm(collectionView: collectionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        configureCollectionView()
        configureNavigationBar()
    }
    
    // MARK: - Methods
    private func configureNavigationBar() {
        title = "Saved"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width - 90, height: view.frame.height - 300)
        
        collectionView = GeminiCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = .systemYellow
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.isDirectionalLockEnabled = false
        
        guard let collectionView = collectionView else { return }
        collectionView.register(SavedCell.self, forCellWithReuseIdentifier: savedCell)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.gemini
            .rollRotationAnimation()
            .degree(45)
            .rollEffect(.rollUp)
    }
    
}

// MARK: - UICollectionViewDelegate
extension SavedVC: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView?.animateVisibleCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? SavedCell {
            self.collectionView?.animateCell(cell)
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
        self.collectionView?.animateCell(cell)
        cell.savedCellDelegate = self
        return cell
    }
}

// MARK: - SavedCellDelegate
extension SavedVC: SavedCellDelegate {
    func deleteAction(cell: SavedCell) {
        if let indexPath = collectionView?.indexPath(for: cell) {
            guard let recipies = recipies else { return }
            guard let collectionView = collectionView else { return }
            collectionView.deleteItems(at: [indexPath])
            RealmManager().deleteFromRealm(collectionView: collectionView, recipeModel: recipies[indexPath.row])
        }
    }
}

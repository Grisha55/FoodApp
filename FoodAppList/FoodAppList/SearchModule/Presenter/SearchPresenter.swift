//
//  SearchPresenter.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit
import Firebase

protocol SearchViewPresenterProtocol {
    init(searchView: SearchView)
    func viewDidLoad(tableView: UITableView, product: String)
}

class SearchPresenter: SearchViewPresenterProtocol {
    
    // MARK: - Properties
    private var searchView: SearchView?
    private var hits: [Hit]?
    
    required init(searchView: SearchView) {
        self.searchView = searchView
    }
    
    func viewDidLoad(tableView: UITableView, product: String) {
        getHitsFromServer(tableView: tableView, product: product)
    }
    
    func getHitsFromServer(tableView: UITableView, product: String) {
        NetworkingService().fetchData(product: product) { [weak self] status in
            guard let self = self else { return }
            switch status {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let hits):
                self.searchView?.onItemsRetrieval(hits: hits)
                tableView.reloadData()
            }
        }
    }
    
    func checkUserStatus(controller: UINavigationController) {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                controller.pushViewController(LoginAndSignUpVC(), animated: true)
            } else {
                controller.pushViewController(RecipeVC(), animated: true)
            }
        }
    }
    
}

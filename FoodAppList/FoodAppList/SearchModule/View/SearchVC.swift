//
//  SearchVC.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit
import SDWebImage

protocol SearchView: AnyObject {
    func onItemsRetrieval(hits: [Hit])
}

class SearchVC: UIViewController {

    // MARK: - Properties
    private let tableView = UITableView()
    private let searchController = UISearchController(searchResultsController: nil)
    private var hits = [Hit]()
    private let searchCell = "searchCell"
    private var searchPresenter: SearchPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 18/255, green: 51/255, blue: 24/255, alpha: 0)
        configureTableView()
        configureSearchController()
        configureBarbutton()
        searchPresenter = SearchPresenter(searchView: self)
        searchPresenter?.viewDidLoad(tableView: tableView, product: "coffee")
    }
    
    // MARK: - Methods
    private func configureBarbutton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(exitAction))
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 18/255, green: 51/255, blue: 24/255, alpha: 1)
    }
    
    @objc func exitAction() {
        FirebaseStore().exitAction()
    }
    
    private func configureSearchController() {
        searchController.searchBar.backgroundColor = UIColor.init(red: 18/255, green: 51/255, blue: 24/255, alpha: 1)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.backgroundColor = UIColor.init(red: 18/255, green: 51/255, blue: 24/255, alpha: 1)
        tableView.separatorColor = .black
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tableView.rowHeight = 400
        tableView.register(SearchCell.self, forCellReuseIdentifier: searchCell)
        tableView.pin(to: view)
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

// MARK: - SearchView
extension SearchVC: SearchView {
    
    func onItemsRetrieval(hits: [Hit]) {
        self.hits = hits
        self.tableView.reloadData()
    }
}

// MARK: - UISearchResultsUpdating
extension SearchVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        searchPresenter?.getHitsFromServer(tableView: tableView, product: text)
    }
}

// MARK: - UITableViewDelegate
extension SearchVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let nv = navigationController else { return }
        searchPresenter?.checkUserStatus(controller: nv, indexPath: indexPath)
    }
}

// MARK: - UITableViewDataSource
extension SearchVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: searchCell, for: indexPath) as? SearchCell else { return UITableViewCell() }
        let hit = hits[indexPath.row]
        guard let title = hit.recipe?.label else { return UITableViewCell() }
        var healthString = ""
        guard let healthLabels = hit.recipe?.healthLabels else { return UITableViewCell() }
        for str in healthLabels {
            healthString += String("\(str)/ ")
        }
        guard let photoString = hit.recipe?.image else { return UITableViewCell() }
        cell.configureCell(title: title, healthLabel: healthString, foodPhotoURL: photoString)
        return cell
    }
}

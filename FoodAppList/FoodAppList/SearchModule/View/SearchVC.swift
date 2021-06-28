//
//  SearchVC.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit

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

        configureTableView()
        configureSearchController()
        configureBarbutton()
        searchPresenter = SearchPresenter(searchView: self)
        searchPresenter?.viewDidLoad(tableView: tableView, product: "coffee")
    }
    
    // MARK: - Methods
    func configureBarbutton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(exitAction))
    }
    
    @objc func exitAction() {
        FirebaseStore().exitAction()
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(SearchCell.self, forCellReuseIdentifier: searchCell)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
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
        cell.configureCell(title: title)
        return cell
    }
}

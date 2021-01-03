//
//  c.swift
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 11/11/19.
//  Copyright © 2019 Abhishek Kumar. All rights reserved.
//

import Foundation

class SearchTest: UIViewController {
    var searchController: CustomSearchController = {
        let controller = CustomSearchController(searchResultsController: nil)
        controller.searchBar.placeholder = NSLocalizedString("Enter keyword (e.g. iceland)", comment: "")
        controller.hidesNavigationBarDuringPresentation = false
        controller.dimsBackgroundDuringPresentation = false
        controller.searchBar.searchBarStyle = .minimal
        controller.searchBar.sizeToFit()
        return controller
    }()
    var tableView = UITableView()
    let searchbar = UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        
        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search here..."
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        navigationItem.title = "fff"
        self.navigationItem.searchController = searchController
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.definesPresentationContext = true
        self.navigationItem.title = "hiii"
        self.title = "hello"
        
        let barButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextMethod))
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc
    func nextMethod() {
        let vc = SearchTest()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        searchController.searchBar.setShowsCancelButton(false, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // self.searchController.searchBar.setShowsCancelButton(false, animated: false)
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .none
    }
    
    let myView: UIView = {
        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
        return label
    }()
    
    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Hellllloooooo"
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
}

extension SearchTest: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}

extension SearchTest: UISearchControllerDelegate {
    func didPresentSearchController(searchController: UISearchController) {
        searchController.searchBar.showsCancelButton = false
    }
}

extension SearchTest: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
         searchBar.setShowsCancelButton(false, animated: false)
        return true
    }
}

class CustomSearchBar: UISearchBar {
    
    override func setShowsCancelButton(_ showsCancelButton: Bool, animated: Bool) {
        super.setShowsCancelButton(false, animated: false)
    }}

class CustomSearchController: UISearchController {
    lazy var _searchBar: CustomSearchBar = {
        [unowned self] in
        let customSearchBar = CustomSearchBar(frame: CGRect.zero)
        return customSearchBar
        }()
    
    override var searchBar: UISearchBar {
        get {
            return _searchBar
        }
    }}

//
//  ViewController.swift
//  Search Demo
//
//  Created by Øyvind Sørensen on 20/01/2018.
//  Copyright © 2018 Øyvind Sørensen. All rights reserved.
//

import UIKit

class SearchController: UITableViewController {

    let reuseIdentifier = "Cell"
    let searchController = UISearchController(searchResultsController: nil)
    
    var cars = [Car]()
    var filteredcars = [Car]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cars = [
            Car(name:"BMW"),
            Car(name:"Chevrolet"),
            Car(name:"Jaguar"),
            Car(name:"Lamborghini"),
            Car(name:"Lotus"),
            Car(name:"Tesla")
        ]
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.tintColor = UIColor.white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.white]
        definesPresentationContext = true
        
        tableView.register(SearchCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
}

extension SearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

extension SearchController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredcars.count
        }
        
        return cars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? SearchCell else { return UITableViewCell() }
        
        let Car: Car!
        
        if isFiltering() {
            Car = filteredcars[indexPath.row]
        } else {
            Car = cars[indexPath.row]
        }
        
        cell.configureCell(Car)
        
        return cell
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredcars = cars.filter({( Car : Car) -> Bool in
            return Car.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
}


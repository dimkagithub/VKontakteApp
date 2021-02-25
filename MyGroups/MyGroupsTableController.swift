//
//  MyGroupsTableController.swift
//  VKontakteApp
//
//  Created by Дмитрий on 10.12.2020.
//

import UIKit

class MyGroupsTableController: UITableViewController {
    
    let networkManager = NetworkManager()
    var myGroups = [Community]()
    var filteredMyGroups = [Community]()
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    var filtering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    let searchController = UISearchController(searchResultsController: nil)
    var myGroupsSections = [GroupsSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.getCommunity() { [weak self] (allGroups) in
            self?.myGroups = allGroups
            let myGroupsDictionary = Dictionary.init(grouping: allGroups) {
                $0.groupName.prefix(1)
            }
            self?.myGroupsSections = myGroupsDictionary.map { GroupsSection(title: String($0.key), items: $0.value) }
            self?.myGroupsSections.sort { $0.title < $1.title }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск..."
        searchController.searchBar.setValue("Отмена", forKey: "cancelButtonText")
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        animateTable()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if filtering {
            return 1
        } else {
            return myGroupsSections.count
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filtering {
            return filteredMyGroups.count
        }
        return myGroupsSections[section].items.count
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? { myGroupsSections.map { $0.title } }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsCell", for: indexPath) as? MyGroupsCell
        else { return UITableViewCell() }
        var groups: Community
        if filtering {
            groups = filteredMyGroups[indexPath.row]
        } else {
            groups = myGroupsSections[indexPath.section].items[indexPath.row]
        }
        cell.configure(with: groups)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10.0))
        view.backgroundColor = .systemGray5
        let label = UILabel(frame: CGRect(x: 42, y: 5, width: tableView.frame.width - 10, height: 20.0))
        label.font = UIFont(name: "Avenir Next Medium", size: 17.0)
        label.text = myGroupsSections[section].title
        view.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MyGroupsTableController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredMyGroups = myGroups.filter({ (allGroups: Community) -> Bool in
            return allGroups.groupName.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}

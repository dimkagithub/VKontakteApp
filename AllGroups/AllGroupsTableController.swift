//
//  AllGroupsTableController.swift
//  VKontakteApp
//
//  Created by Дмитрий on 10.12.2020.
//

import UIKit

class AllGroupsTableController: UITableViewController {
    
    let networkManager = NetworkManager()
    
    var allGroups = [Community]()
    var filteredGroups = [Community]()
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    var filtering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    let searchController = UISearchController(searchResultsController: nil)
    var allGroupsSections = [AllGroupsSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.getCommunity(onComplete: { [weak self] (communities) in
            self?.allGroups = communities
            
            let allGroupsDictionary = Dictionary.init(grouping: communities) {
                $0.name.prefix(1)
            }
            self?.allGroupsSections = allGroupsDictionary.map { AllGroupsSection(title: String($0.key), items: $0.value) }
            self?.allGroupsSections.sort { $0.title < $1.title }
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }) { (error) in
            print(error)
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
            return allGroupsSections.count
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filtering {
            return filteredGroups.count
        }
        return allGroupsSections[section].items.count
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? { allGroupsSections.map { $0.title } }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as? AllGroupsCell
        else { return UITableViewCell() }
        var groups: Community
        if filtering {
            groups = filteredGroups[indexPath.row]
        } else {
            groups = allGroupsSections[indexPath.section].items[indexPath.row]
        }
//        cell.groupImage.image = groups.avatarURL
        cell.configure(with: groups)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10.0))
        view.backgroundColor = .systemGray5
        let label = UILabel(frame: CGRect(x: 42, y: 5, width: tableView.frame.width - 10, height: 20.0))
        label.font = UIFont(name: "Avenir Next Medium", size: 17.0)
        label.text = allGroupsSections[section].title
        view.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AllGroupsTableController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredGroups = allGroups.filter({ (allGroups: Community) -> Bool in
            return allGroups.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}

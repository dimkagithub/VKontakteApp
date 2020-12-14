//
//  AllGroupsTableController.swift
//  VKontakteApp
//
//  Created by Дмитрий on 10.12.2020.
//

import UIKit

class AllGroupsTableController: UITableViewController {

    let allGroups = Groups.makeGroups().sorted{ $0.name < $1.name }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupsCell
        else { return UITableViewCell() }
        cell.groupImage.image = allGroups[indexPath.row].image
        cell.groupName.text = allGroups[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

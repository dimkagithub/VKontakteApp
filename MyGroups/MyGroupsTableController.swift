//
//  MyGroupsTableController.swift
//  VKontakteApp
//
//  Created by Дмитрий on 10.12.2020.
//

import UIKit

class MyGroupsTableController: UITableViewController {
    
    var myGroups = [String]()
    var myGroupsImages = [UIImage]()
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        guard
            segue.identifier == "addGroup",
            let controller = segue.source as? AllGroupsTableController,
            let indexPath = controller.tableView.indexPathForSelectedRow,
            !myGroups.contains(controller.allGroups[indexPath.row].name)
        else { return }
        let group = controller.allGroups[indexPath.row]
        myGroups.append(group.name)
        myGroupsImages.append(group.image!)
        tableView.reloadData()

    }
    
    override func tableView(_ tableView: UITableView, commit editingStryle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStryle == .delete {
            myGroups.remove(at: indexPath.row)
            myGroupsImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupsCell
        else { return UITableViewCell() }
        cell.groupName.text = myGroups[indexPath.row]
        cell.groupImage.image = myGroupsImages[indexPath.row]
        return cell
    }
    
}

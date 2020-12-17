//
//  MyFriendsTableController.swift
//  VKontakteApp
//
//  Created by Дмитрий on 10.12.2020.
//

import UIKit

class MyFriendsTableController: UITableViewController {
    
    enum UserStatus: String, CaseIterable {
        case online = "В сети"
        case offline = "Не в сети"
        static func setRandomStatus() -> UserStatus {
            return UserStatus.allCases[Int.random(in: 0...1)]
        }
    }
    
    let myFriends = Friends.makeFriends().sorted{ $0.userName < $1.userName }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myFriends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let status = UserStatus.setRandomStatus()
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsCell
        else { return UITableViewCell() }
        cell.friendImage.image = myFriends[indexPath.row].userAvatar
        cell.friendName.text = myFriends[indexPath.row].userName
        cell.friendStatus.textColor = status == .online ? .black : .lightGray
        cell.friendStatus.text = status.rawValue
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowUserInfo" {
            let controller = segue.destination as! FriendsCollectionController
            if let index = tableView.indexPathForSelectedRow {
                let user = myFriends[index.row]
                controller.images = user.userImages
                controller.title = user.userName
            }
        }
    }
    
}

//
//  NewsTableController.swift
//  VKontakteApp
//
//  Created by Дмитрий on 20.12.2020.
//

import UIKit

class NewsTableController: UITableViewController {
    
    let myFriends = Friends.makeFriends()
    let news = NewsClass.makeNews()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell
        else { return UITableViewCell() }
        let postDate = getRandomTime(month: 12)
        cell.newsProfileAvatar.image = myFriends[indexPath.row].userAvatar
        cell.newsProfileName.text = myFriends[indexPath.row].userName
        cell.newsProfileDateStamp.text = postDate
        cell.newsProfileText.text = news[indexPath.row].newsText
        cell.newsProfileImage.image = news[indexPath.row].newsImage
        let viewsCount = Int.random(in: 0...99)
        cell.newsProfileViewsCounter.textColor = viewsCount == 0 ? .black : .systemBlue
        cell.newsProfileViewsSign.tintColor = viewsCount == 0 ? .black : .systemBlue
        cell.newsProfileViewsCounter.text = String(viewsCount)
        return cell
    }

}

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
        return myFriends.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    let numberOfRows = 4
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch numberOfRows {
        case 4:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileNewsCell") as! ProfileNewsCell
                cell.profileNewsImage.image = myFriends[indexPath.section].userAvatar
                cell.profileNewsName.text = myFriends[indexPath.section].userName
                cell.profileNewsTimeStamp.text = getRandomTime(month: 12)
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextNewsCell") as! TextNewsCell
                cell.textNews.text = news[indexPath.section].newsText
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNewsCell") as! ImageNewsCell
                cell.imageNews.image = news[indexPath.section].newsImage
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ActionsNewsCell") as! ActionsNewsCell
                let viewsCount = Int.random(in: 0...99)
                cell.actionsNewsViewCounter.textColor = viewsCount == 0 ? .black : .systemBlue
                cell.actionsNewsViewSign.tintColor = viewsCount == 0 ? .black : .systemBlue
                cell.actionsNewsViewCounter.text = String(viewsCount)
                return cell
            }
        case 3:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileNewsCell") as! ProfileNewsCell
                cell.profileNewsImage.image = myFriends[indexPath.section].userAvatar
                cell.profileNewsName.text = myFriends[indexPath.section].userName
                cell.profileNewsTimeStamp.text = getRandomTime(month: 12)
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextNewsCell") as! TextNewsCell
                cell.textNews.text = news[indexPath.section].newsText
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ActionsNewsCell") as! ActionsNewsCell
                let viewsCount = Int.random(in: 0...99)
                cell.actionsNewsViewCounter.textColor = viewsCount == 0 ? .black : .systemBlue
                cell.actionsNewsViewSign.tintColor = viewsCount == 0 ? .black : .systemBlue
                cell.actionsNewsViewCounter.text = String(viewsCount)
                return cell
            }
        case 2:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileNewsCell") as! ProfileNewsCell
                cell.profileNewsImage.image = myFriends[indexPath.section].userAvatar
                cell.profileNewsName.text = myFriends[indexPath.section].userName
                cell.profileNewsTimeStamp.text = getRandomTime(month: 12)
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNewsCell") as! ImageNewsCell
                cell.imageNews.image = news[indexPath.section].newsImage
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ActionsNewsCell") as! ActionsNewsCell
                let viewsCount = Int.random(in: 0...99)
                cell.actionsNewsViewCounter.textColor = viewsCount == 0 ? .black : .systemBlue
                cell.actionsNewsViewSign.tintColor = viewsCount == 0 ? .black : .systemBlue
                cell.actionsNewsViewCounter.text = String(viewsCount)
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}
 
/*
 let nubmerOfRows = news[indexPath.section].numberOfRows
         switch nubmerOfRows {
         case 2:
             switch indexPath.row {
             case 0:
                 guard let cellTop = tableView.dequeueReusableCell(withIdentifier: "NewsTopCell") as? NewsTopCell else {preconditionFailure("NewsTopCell err")}
                 cellTop.configureNewsTop(with: news[indexPath.section])
                 cellTop.selectionStyle = .none
                 return cellTop
             case (nubmerOfRows-1):
                 guard let cellBottom = tableView.dequeueReusableCell(withIdentifier: "NewsBottomCell") as? NewsBottomCell else {preconditionFailure("NewsBottomCell err")}
                 cellBottom.configureNewsBottom(with: news[indexPath.section])
                 cellBottom.selectionStyle = .none
                 return cellBottom
             default:
                 fatalError()
             }
         case 3:
             switch indexPath.row {
             case 0:
                 guard let cellTop = tableView.dequeueReusableCell(withIdentifier: "NewsTopCell") as? NewsTopCell else {preconditionFailure("NewsTopCell err")}
                 cellTop.configureNewsTop(with: news[indexPath.section])
                 cellTop.selectionStyle = .none
                 return cellTop
             case 1:
                 var cell = UITableViewCell()
                 if news[indexPath.section].newsText != ""{
                     guard let cellText = tableView.dequeueReusableCell(withIdentifier: "NewsTextCell") as? NewsTextCell else {preconditionFailure("NewsTextCell err")}
                     cellText.indexPath = indexPath
                     cellText.delegate = self
                     cellText.configureNewsTextCell(with: news[indexPath.section])
                     cellText.selectionStyle = .none
                     cell = cellText
                 } else if news[indexPath.section].photoAttachments.count > 0 ||
                     news[indexPath.section].gifUrl != ""{
                     guard let cellPhoto = tableView.dequeueReusableCell(withIdentifier: "NewsImageCell") as? NewsImageCell else {preconditionFailure("NewsImageCell err")}
                     cellPhoto.configureImageCell(with: news[indexPath.section])
                     cellPhoto.selectionStyle = .none
                     cell = cellPhoto
                 } else if news[indexPath.section].videoAttachments.count > 0 {
                     guard let cellVideo = tableView.dequeueReusableCell(withIdentifier: "NewsVideoCell") as? NewsVideoCell else {preconditionFailure("NewsVideoCell err")}
                     cellVideo.configureVideoCell(with: news[indexPath.section])
                     cellVideo.selectionStyle = .none
                     cell = cellVideo
                 }
                 return cell
             case (nubmerOfRows-1):
                 guard let cellBottom = tableView.dequeueReusableCell(withIdentifier: "NewsBottomCell") as? NewsBottomCell else {preconditionFailure("NewsBottomCell err")}
                 cellBottom.configureNewsBottom(with: news[indexPath.section])
                 cellBottom.selectionStyle = .none
                 return cellBottom
             default:
                 fatalError("Something wrong with cells")
             }
         case 4:
             switch indexPath.row {
             case 0:
                 guard let cellTop = tableView.dequeueReusableCell(withIdentifier: "NewsTopCell") as? NewsTopCell else {preconditionFailure("NewsTopCell err")}
                 cellTop.configureNewsTop(with: news[indexPath.section])
                 cellTop.selectionStyle = .none
                 return cellTop
             case 1:
                 guard let cellText = tableView.dequeueReusableCell(withIdentifier: "NewsTextCell") as? NewsTextCell else {preconditionFailure("NewsTextCell err")}
                 cellText.indexPath = indexPath
                 cellText.delegate = self
                 cellText.configureNewsTextCell(with: news[indexPath.section])
                 cellText.selectionStyle = .none
                 return cellText
             case 2:
                 var cell = UITableViewCell()
                 if news[indexPath.section].photoAttachments.count > 0 ||
                     news[indexPath.section].gifUrl != "" {
                     guard let cellPhoto = tableView.dequeueReusableCell(withIdentifier: "NewsImageCell") as? NewsImageCell else {preconditionFailure("NewsImageCell err")}
                     cellPhoto.configureImageCell(with: news[indexPath.section])
                     cellPhoto.selectionStyle = .none
                     cell = cellPhoto
                 } else if news[indexPath.section].videoAttachments.count > 0{
                     guard let cellVideo = tableView.dequeueReusableCell(withIdentifier: "NewsVideoCell") as? NewsVideoCell else {preconditionFailure("NewsVideoCell err")}
                     cellVideo.configureVideoCell(with: news[indexPath.section])
                     cellVideo.selectionStyle = .none
                     cell = cellVideo
                 }
                 return cell
             case (nubmerOfRows-1):
                 guard let cellBottom = tableView.dequeueReusableCell(withIdentifier: "NewsBottomCell") as? NewsBottomCell else {preconditionFailure("NewsBottomCell err")}
                 cellBottom.configureNewsBottom(with: news[indexPath.section])
                 cellBottom.selectionStyle = .none
                 return cellBottom
             default:
                 fatalError("Something wrong with cells")
             }
         default:
             fatalError("Something wrong news.numberOfRows")
         }
 */

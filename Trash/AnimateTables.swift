////
////  AnimateTables.swift
////  VKontakteApp
////
////  Created by Дмитрий on 19.12.2020.
////
//
//import UIKit
//
//extension UITableViewController {
//    func animateTable() {
//        tableView.reloadData()
//        let cells = tableView.visibleCells
//        let tableHeight: CGFloat = tableView.bounds.size.height
//        for i in cells {
//            let cell: UITableViewCell = i as UITableViewCell
//            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
//        }
//        var index = 0
//        for a in cells {
//            let cell: UITableViewCell = a as UITableViewCell
//            cell.alpha = 0
//            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//                cell.transform = CGAffineTransform(translationX: 0, y: 0)
//                cell.alpha = 1
//            }, completion: nil)
//            index += 1
//        }
//    }
//}

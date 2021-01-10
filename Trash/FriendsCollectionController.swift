////
////  FriendsCollectionController.swift
////  VKontakteApp
////
////  Created by Дмитрий on 10.12.2020.
////
//
//import UIKit
//
//class FriendsCollectionController: UICollectionViewController {
//    
//    let itemPerRow: CGFloat = 1.0
//    let sectionInserts = UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
//    
//    var images = [UIImage?]()
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "pickFriendImage" {
//            let imageVC = segue.destination as! ProfileViewController
//            let cell = sender as! FriendCell
//            imageVC.image = cell.userImage.image
//        }
//    }
//    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return images.count
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as? FriendCell
//        else { return UICollectionViewCell() }
//        cell.userImage.image = images[indexPath.row]
//        return cell
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//}
//
//extension FriendsCollectionController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let paddingWidth: CGFloat = sectionInserts.left * (itemPerRow + 1.0)
//        let availableWidth = collectionView.frame.width - paddingWidth
//        let widthPerItem = availableWidth / itemPerRow
//        return CGSize(width: widthPerItem, height: widthPerItem)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return sectionInserts
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInserts.left
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt srction: Int) -> CGFloat {
//        return sectionInserts.left
//    }
//}

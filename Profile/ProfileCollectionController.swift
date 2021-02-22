//
//  ProfileCollectionController.swift
//  VKontakteApp
//
//  Created by Дмитрий on 17.12.2020.
//

import UIKit

class ProfileCollectionController: UICollectionViewController {
    
    let profile = ProfileClass.makeProfile()
    
    let itemPerRow: CGFloat = 1.0
    let sectionInserts = UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: 20.0, height: 20.0)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickProfileImage" {
            let imageVC = segue.destination as! ProfileViewController
            let cell = sender as! ProfileCell
            imageVC.image = cell.profileImage.image
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profile[section].profileImages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        cell.profileImage.image = profile[indexPath.section].profileImages[indexPath.row]
        return cell
    }
}

extension ProfileCollectionController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth: CGFloat = sectionInserts.left * (itemPerRow + 1.0)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt srction: Int) -> CGFloat {
        return sectionInserts.left
    }
}

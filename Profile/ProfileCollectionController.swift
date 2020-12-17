//
//  ProfileCollectionController.swift
//  VKontakteApp
//
//  Created by Дмитрий on 17.12.2020.
//

import UIKit

class ProfileCollectionController: UICollectionViewController {
    
    let profile = ProfileClass.makeProfile()
    
    let disneyImages = ["p1","p2","p3","p4","p5","p6","p7","p8","p9","p10",]
    
    let itemPerRow: CGFloat = 2.0
    let sectionInserts = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: 20.0, height: 20.0)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 1
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return disneyImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        let imageName = disneyImages[indexPath.item]
        let image = UIImage(named: imageName)
        cell.profileImage.image = image
        // Configure the cell
    
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

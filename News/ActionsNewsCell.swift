//
//  ActionsNewsCell.swift
//  VKontakteApp
//
//  Created by Дмитрий on 23.12.2020.
//

import UIKit

class ActionsNewsCell: UITableViewCell {

    @IBOutlet weak var actionsNewsViewCounter: UILabel!
    @IBOutlet weak var actionsNewsViewSign: UIButton!
    @IBOutlet weak var actionsNewsLikeCounter: UILabel!
    @IBOutlet weak var actionsNewsLikeButton: UIButton!
    @IBAction func pulseButton(_ sender: UIButton) {
        sender.pulsate()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        layer.borderColor = UIColor.lightGray.cgColor
//        layer.borderWidth = 0.5
//        layer.cornerRadius = 10
        actionsNewsLikeButton .setImage(#imageLiteral(resourceName: "redlike"), for: .selected)
        actionsNewsLikeButton.setImage(#imageLiteral(resourceName: "bluelike"), for: .normal)
        actionsNewsLikeCounter.textColor = actionsNewsLikeButton.isSelected ? .red : .systemBlue
        actionsNewsLikeCounter.text = "0"
    }
    
    @IBAction func like() {
        actionsNewsLikeButton.isSelected.toggle()
        actionsNewsLikeCounter.textColor = actionsNewsLikeButton.isSelected ? .red : .systemBlue
        actionsNewsLikeCounter.text = actionsNewsLikeButton.isSelected ? "1" : "0"
    }
}

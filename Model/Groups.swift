//
//  Groups.swift
//  VKontakteApp
//
//  Created by Дмитрий on 11.12.2020.
//

import UIKit

struct AllGroupsSections {
    var title: String
    var items: [AllGroups]
    
}

struct AllGroups {
    let groupName: String
    let groupImage: UIImage?
}

final class Groups {
    static func makeGroups() -> [AllGroups] {
        let recordBook = AllGroups(groupName: "Книга Рекордов", groupImage: UIImage(named: "g1"))
        let rakish90 = AllGroups(groupName: "Лихие 90-е", groupImage: UIImage(named: "g2"))
        let fourCh = AllGroups(groupName: "4ch", groupImage: UIImage(named: "g3"))
        let leprosarium = AllGroups(groupName: "Лепрозорий", groupImage: UIImage(named: "g4"))
        let reddit = AllGroups(groupName: "Reddit", groupImage: UIImage(named: "g5"))
        let apple = AllGroups(groupName: "Apple", groupImage: UIImage(named: "g6"))
        let lepra = AllGroups(groupName: "Лепра", groupImage: UIImage(named: "g7"))
        let mdk = AllGroups(groupName: "MDK", groupImage: UIImage(named: "g8"))
        let fifties = AllGroups(groupName: "1950's", groupImage: UIImage(named: "g9"))
        let habr = AllGroups(groupName: "Habr", groupImage: UIImage(named: "g10"))
        return [recordBook, rakish90, fourCh, leprosarium, reddit, apple, lepra, mdk, fifties, habr]
    }
}

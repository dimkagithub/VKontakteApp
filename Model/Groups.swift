//
//  Groups.swift
//  VKontakteApp
//
//  Created by Дмитрий on 11.12.2020.
//

import UIKit

struct AllGroups {
    let name: String
    let image: UIImage?
}

final class Groups {
    static func makeGroups() -> [AllGroups] {
        let recordBook = AllGroups(name: "Книга Рекордов", image: UIImage(named: "g1"))
        let rakish90 = AllGroups(name: "Лихие 90-е", image: UIImage(named: "g2"))
        let fourCh = AllGroups(name: "4ch", image: UIImage(named: "g3"))
        let leprosarium = AllGroups(name: "Лепрозорий", image: UIImage(named: "g4"))
        let reddit = AllGroups(name: "Reddit", image: UIImage(named: "g5"))
        let apple = AllGroups(name: "Apple", image: UIImage(named: "g6"))
        let lepra = AllGroups(name: "Лепра", image: UIImage(named: "g7"))
        let mdk = AllGroups(name: "MDK", image: UIImage(named: "g8"))
        let fifties = AllGroups(name: "1950's", image: UIImage(named: "g9"))
        let habr = AllGroups(name: "Habr", image: UIImage(named: "g10"))
        return [recordBook, rakish90, fourCh, leprosarium, reddit, apple, lepra, mdk, fifties, habr]
    }
}

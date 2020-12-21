//
//  GetRandomTime.swift
//  VKontakteApp
//
//  Created by Дмитрий on 21.12.2020.
//

import UIKit

func getRandomTime(month: Int) -> String {
    let date: Date = Date() - TimeInterval(Int.random(in: 0...(2629744 * month)))
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ru_RU")
    dateFormatter.dateFormat = "d MMM yyyy в HH:mm"
    let postDate = String(dateFormatter.string(from: date))
    return postDate
}

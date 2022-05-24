//
//  CourseCard.swift
//  UNATI
//
//  Created by sml on 17/05/22.
//

import Foundation

class CourseCard {
    let image: String
    let day1: String
    let day2: String
    let hour: String
    let title: String
    let address: String
    let descriptionText: String
    let link: String

    init(image: String, day1: String, day2: String, hour: String, title: String, address: String, descriptionText: String, link: String){
        self.image = image
        self.day1 = day1
        self.day2 = day2
        self.hour = hour
        self.title = title
        self.address = address
        self.descriptionText = descriptionText
        self.link = link
    }
}

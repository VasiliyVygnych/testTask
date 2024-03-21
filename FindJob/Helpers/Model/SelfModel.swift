//
//  Model.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 15.03.2024.
//

import UIKit

struct SelfModel {
    var model: [Model]
}

struct Model {
    let image: [UIImage?]
    let title: String?
    let subtitle: String?
}

var modelH = [Model(image: images, title: "Вакансии рядом с вами", subtitle: nil),
             Model(image: images, title: "Поднять резюме в поиске", subtitle: "Поднять"),
             Model(image: images, title: "Временная работа и подработка", subtitle: nil)]

let images = [UIImage(named: "hOne"),
              UIImage(named: "hTwo"),
              UIImage(named: "hThree")]

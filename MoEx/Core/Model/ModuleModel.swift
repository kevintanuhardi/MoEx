//
//  Module.swift
//  MoEx
//
//  Created by Ahmad Zaky on 08/06/21.
//

import Foundation
import UIKit

struct ModuleModel {
    let title: String
    let thumb: UIImage
    let module_desc: String
    let exercise: [Exercise]?
    let time: Int?
    let calories: Int?
}

struct Exercise {
//    let gif: String
    let title: String
    let thumb: UIImage
    let benefits: [Benefit]?
    let equipment: String?
    let reps: Int
    let illustrations: [UIImage]?
    let howTo: [HowTo]?
}

struct Benefit {
    let description: String
}

struct HowTo {
    let description: String
}

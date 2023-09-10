//
//  SectionModel.swift
//  EnglishKelimeApp
//
//  Created by Salih on 9.09.2023.
//

import Foundation
import UIKit

struct SectionModel {
    
    var id:Int
    var title : String
    var subtitle : String
    var color: UIColor
    var shadowColor:UIColor
    var images : UIImage
    var description : String
    
}

var sectionModelData = [
    SectionModel(id: 0, title: "1-99 Kelime", subtitle: "A1-A2", color: UIColor(named: "NewRed")!, shadowColor: UIColor(named: "NewRed")!, images: UIImage(named: "waves5")!, description: "asada"),
    SectionModel(id: 1, title: "100-199 Kelime", subtitle: "A1-A2", color: UIColor(named: "UpworkColor")!, shadowColor: UIColor(named: "UpworkColor")!, images: UIImage(named: "waves5")!, description: "asada"),
    SectionModel(id: 2, title: "200-399 Kelime", subtitle: "A1-A2", color: UIColor(named: "LightBlue")!, shadowColor: UIColor(named: "LightBlue")!, images: UIImage(named: "waves5")!, description: "asada"),
    SectionModel(id: 3, title: "400-599 Kelime", subtitle: "A1-A2", color: UIColor(named: "NewYellow")!, shadowColor: UIColor(named: "NewYellow")!, images: UIImage(named: "waves5")!, description: "asada"),
]



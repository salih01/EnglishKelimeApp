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
    SectionModel(id: 0, title: "1-99 Kelime", subtitle: "A1-A2", color: UIColor(named: "black_")!, shadowColor: UIColor(named: "black_")!, images: UIImage(named: "sprite05")!, description: "asada"),
    SectionModel(id: 1, title: "100-199 Kelime", subtitle: "A1-A2", color: UIColor(named: "UpworkColor")!, shadowColor: UIColor(named: "UpworkColor")!, images: UIImage(named: "sprite02")!, description: "asada"),
    SectionModel(id: 0, title: "200-299 Kelime", subtitle: "A1-A2", color: UIColor(named: "Green")!, shadowColor: UIColor(named: "Green")!, images: UIImage(named: "sprite03")!, description: "asada"),

    SectionModel(id: 3, title: "300-399 Kelime", subtitle: "A1-A2", color: UIColor(named: "LightGreen")!, shadowColor: UIColor(named: "LightGreen")!, images: UIImage(named: "sprite09")!, description: "asada"),
    SectionModel(id: 2, title: "400-499 Kelime", subtitle: "A1-A2", color: UIColor(named: "Orange")!, shadowColor: UIColor(named: "Orange")!, images: UIImage(named: "sprite10")!, description: "asada"),

]



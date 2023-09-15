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
    SectionModel(id: 1, title: "100-199", subtitle: "A1-A2", color: UIColor(named: "Purple1")!, shadowColor: UIColor(named: "Purple1")!, images: UIImage(named: "sprite09")!, description: "asada"),
    SectionModel(id: 2, title: "200-299 Kelime", subtitle: "A1-A2", color: UIColor(named: "Yellow1")!, shadowColor: UIColor(named: "Yellow1")!, images: UIImage(named: "sprite10")!, description: "asada"),
    SectionModel(id: 3, title: "300-399 Kelime", subtitle: "A2-B1", color: UIColor(named: "NewRed")!, shadowColor: UIColor(named: "NewRed")!, images: UIImage(named: "sprite03")!, description: "asada"),
    SectionModel(id: 4, title: "400-499 Kelime", subtitle: "B1-B2", color: UIColor(named: "Blue1")!, shadowColor: UIColor(named: "Blue1")!, images: UIImage(named: "sprite09")!, description: "asada"),
    SectionModel(id: 5, title: "500-599 Kelime", subtitle: "B1-B2", color: UIColor(named: "UpworkColor")!, shadowColor: UIColor(named: "UpworkColor")!, images: UIImage(named: "sprite02")!, description: "asada"),
    SectionModel(id: 6, title: "600-699 Kelime", subtitle: "B1-B2", color: UIColor(named: "LightGreen")!, shadowColor: UIColor(named: "LightGreen")!, images: UIImage(named: "sprite09")!, description: "asada"),
    SectionModel(id: 7, title: "700-799 Kelime", subtitle: "B2-C1", color: UIColor(named: "Orange1")!, shadowColor: UIColor(named: "Orange1")!, images: UIImage(named: "sprite11")!, description: "asada"),
    SectionModel(id: 8, title: "800-899 Kelime", subtitle: "C1", color: UIColor(named: "NewYellow")!, shadowColor: UIColor(named: "NewYellow")!, images: UIImage(named: "sprite10")!, description: "asada"),
    SectionModel(id: 9, title: "900-999 Kelime", subtitle: "C1", color: UIColor(named: "DarkRed")!, shadowColor: UIColor(named: "DarkRed")!, images: UIImage(named: "sprite09")!, description: "asada"),

]



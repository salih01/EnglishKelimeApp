//
//  SectionOne.swift
//  EnglishKelimeApp
//
//  Created by Salih on 17.09.2023.
//

import Foundation
//
//  SectionModel.swift
//  EnglishKelimeApp
//
//  Created by Salih on 9.09.2023.
//

import Foundation
import UIKit

struct SectionOne {
    
    var id:Int
    var title : String
    var animationName : String
    var backView: String
    var collectionViewCell:String
    
}

var SectionOneData = [
    SectionOne(id: 0, title: "1-10 Kelime", animationName: "cat2", backView:"UpworkColor", collectionViewCell: "cell199"),
    SectionOne(id: 1, title: "11-19 Kelime", animationName: "cat", backView:"UpworkColor", collectionViewCell: "cell100199"),
    SectionOne(id: 2, title: "20-29 Kelime", animationName: "talk", backView:"UpworkColor", collectionViewCell: "cell100199"),


]



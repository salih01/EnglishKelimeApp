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
    var backView: UIColor
    var collectionViewCell:String
    
}

var SectionOneData = [
    SectionOne(id: 0, title: "1-99 Kelime", animationName: "back&black", backView:UIColor(named: "black_")!, collectionViewCell: "cell199"),
    SectionOne(id: 1, title: "1-99 Kelime", animationName: "199", backView:UIColor(named: "black_")!, collectionViewCell: "cell100199"),

]



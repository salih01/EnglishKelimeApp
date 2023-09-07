//
//  HomeTableViewCell.swift
//  EnglishKelimeApp
//
//  Created by Salih on 7.09.2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    
    func setupCell(title: String, imageName: String) {
        dayLabel.text = title
        backImage.image = UIImage(named: imageName)
        
        // İhtiyaca bağlı diğer ayarlamaları yapabilirsiniz
    }
}

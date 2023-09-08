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
    @IBOutlet weak var effect: UIVisualEffectView!
    

    func setupCell(title: String, imageName: String) {
        dayLabel.text = title
        backImage.image = UIImage(named: imageName)
        
        backImage.addCornerRadius(radius: 20)
        backImage.clipsToBounds = true
        effect.layer.cornerRadius = 20
        effect.clipsToBounds = true




        // İhtiyaca bağlı diğer ayarlamaları yapabilirsiniz
    }
}

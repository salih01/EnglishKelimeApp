//
//  OnboardingCollectionViewCell.swift
//  EnglishKelimeApp
//
//  Created by Salih on 16.07.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var image: UIImageView!

    func setup(backImage:UIImage){
        image.image = backImage
    }

}

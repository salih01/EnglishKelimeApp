//
//  MainViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 6.07.2023.
//

import UIKit

class MainViewController: UIViewController {


    
    @IBOutlet weak var tabbarBackView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var launchView: UIImageView!
    @IBOutlet weak var tabbarImage: UIImageView!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    
    let cornerRadius : CGFloat = 25.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.addCornerRadiusAndShadow(cornerRadius: cornerRadius, shadowColor: .darkGray, shadowOpacity: 0.2, shadowOffset: CGSize(width: 5.0, height: 5.0), shadowRadius: 5)
        launchView.addCornerRadius(radius: 15.0)

        tabbarBackView.addCornerRadiusAndShadow(cornerRadius: 20, shadowColor: .black, shadowOpacity: 10, shadowOffset: CGSize(width: 10, height: 10), shadowRadius: 10)
        tabbarImage.addCornerRadius(radius: 15.0)

        tabbarImage.blurEffectLight(view: tabbarImage, alpha: 0.7)


    }

}

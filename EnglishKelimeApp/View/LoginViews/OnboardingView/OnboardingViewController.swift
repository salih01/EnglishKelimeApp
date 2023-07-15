//
//  OnboardingViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 6.07.2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        testView.addCornerRadiusAndShadow(cornerRadius: 40, shadowColor: .darkGray, shadowOpacity: 0.2, shadowOffset: CGSize(width: 0.2, height: 3), shadowRadius: 1)
        testView.addBorder(color: UIColor(named:"borderColor")!, width: 0.7)
        
    }




}

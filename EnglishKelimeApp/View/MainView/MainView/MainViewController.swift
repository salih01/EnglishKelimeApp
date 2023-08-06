//
//  MainViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 6.07.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var blurView2: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()


    }
    func initUI(){
        blurView.layer.cornerRadius = 30
        blurView.clipsToBounds = true
        blurView2.addCornerRadiusAndShadow(cornerRadius: 20, shadowColor: .black, shadowOpacity: 10, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 10)
    }

    @IBAction func button(_ sender: Any) {

    }
}

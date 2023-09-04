//
//  HomeViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 10.08.2023.
//

import UIKit
import Lottie

class HomeViewController: UIViewController {

    @IBOutlet weak var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
        // Do any additional setup after loading the view.
    }

    private func setupAnimation() {
        animationView.animation = LottieAnimation.named("wawes")
        animationView.contentMode = .scaleAspectFill
           animationView.loopMode = .loop
           animationView.animationSpeed = 1
           animationView.play()
        
        
       }
    

}

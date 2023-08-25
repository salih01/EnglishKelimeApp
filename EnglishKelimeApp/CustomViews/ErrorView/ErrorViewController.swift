//
//  ErrorViewController.swift
//  EnglishKelimeApp
//
//  Created by Salih on 21.08.2023.
//

import UIKit
import Lottie

class ErrorViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    var animationName: String?
    var descriptionLabels:String?
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {

      super.viewDidLoad()
        backView.addCornerRadiusAndShadow(cornerRadius: 20, shadowColor: .black, shadowOpacity: 10, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 10)
        backView.clipsToBounds = true
        if let descriptionLabels = descriptionLabels {
            descriptionLabel.text = descriptionLabels
        }
        if let animationName = animationName {
            setupAnimation(named: animationName)
            
        }

    }
    private func setupAnimation(named animationName: String) {
        animationView.animation = LottieAnimation.named(animationName)
           animationView.contentMode = .scaleAspectFit
           animationView.loopMode = .loop
           animationView.animationSpeed = 0.5
           animationView.play()
       }
    

}

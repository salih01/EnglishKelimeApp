//
//  ErrorViewController.swift
//  EnglishKelimeApp
//
//  Created by Salih on 21.08.2023.
//

import UIKit
import Lottie

class ErrorViewController: UIViewController {

    @IBOutlet weak var animationView: LottieAnimationView!
    var animationName: String?
    override func viewDidLoad() {

      super.viewDidLoad()
        if let animationName = animationName {
            setupAnimation(named: animationName)
            
        }
        
  
    }
    private func setupAnimation(named animationName: String) {
        animationView = .init(animationName: animationName)
           animationView.contentMode = .scaleAspectFit
           animationView.loopMode = .loop
           animationView.animationSpeed = 0.5
           animationView.play()
       }
    

}

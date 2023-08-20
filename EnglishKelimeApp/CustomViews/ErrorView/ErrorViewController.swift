//
//  ErrorViewController.swift
//  EnglishKelimeApp
//
//  Created by Salih on 21.08.2023.
//

import UIKit
import Lottie

class ErrorViewController: UIViewController {
    // 1. Create the LottieAnimationView
    private var animationView: LottieAnimationView?

    override func viewDidLoad() {

      super.viewDidLoad()
      
      // 2. Start LottieAnimationView with animation name (without extension)
      
      animationView = .init(name: "coffee")
      
      animationView!.frame = view.bounds
      
      // 3. Set animation content mode
      
      animationView!.contentMode = .scaleAspectFit
      
      // 4. Set animation loop mode
      
      animationView!.loopMode = .loop
      
      // 5. Adjust animation speed
      
      animationView!.animationSpeed = 0.5
      
      view.addSubview(animationView!)
      
      // 6. Play animation
      
      animationView!.play()
      
    }

}

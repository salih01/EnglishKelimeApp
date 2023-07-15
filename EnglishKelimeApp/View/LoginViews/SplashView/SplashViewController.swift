//
//  SplashViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 6.07.2023.
//

import UIKit

class SplashViewController: UIViewController {
    
    var isUserLoggedIn:Bool = false
    
    @IBOutlet weak var imageView: UIView!
    
    @IBOutlet weak var launchView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.addCornerRadiusAndShadow(cornerRadius: 15, shadowColor: UIColor(named:"Green") ?? .blue, shadowOpacity: 0.9, shadowOffset: CGSize(width: 5.0, height: 5.0), shadowRadius: 25.0)
        launchView.addCornerRadius(radius: 15.0)
        
    }
    private func showinitialView() {
        if isUserLoggedIn {
            let vc = MainViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        } else {
            let vc = OnboardingViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delay(durationInSeconds: 2.0) {
            self.showinitialView()
        }
    }
    

    
    
    
}

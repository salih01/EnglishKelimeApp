//
//  SplashViewController.swift
//  EnglishKelimeApp
//
//  Created by Salih on 6.07.2023.
//

import UIKit

class SplashViewController: UIViewController {
    
    var isUserLoggedIn:Bool = false
    
    @IBOutlet weak var imageView: UIView!
    
    @IBOutlet weak var launchView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.addCornerRadiusAndShadow(cornerRadius: 15, shadowColor: .darkGray, shadowOpacity: 0.2, shadowOffset: CGSize(width: 5.0, height: 5.0), shadowRadius: 10)
        launchView.addCornerRadius(radius: 15.0)
        
    }
    private func showInitialView() {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            if isUserLoggedIn {
                // Kullanıcı giriş yapmışsa, MainViewController'ı göster
                let mainVC = MainViewController()
                sceneDelegate.window?.rootViewController = UINavigationController(rootViewController: mainVC)
            } else {
                // Kullanıcı giriş yapmamışsa, OnboardingViewController'ı göster
                let onboardingVC = OnboardingViewController()
                sceneDelegate.window?.rootViewController = UINavigationController(rootViewController: onboardingVC)
            }
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delay(durationInSeconds: 2.0) {
            self.showInitialView()
        }
    }
    

    
    
    
}

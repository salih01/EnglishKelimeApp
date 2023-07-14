//
//  SplashViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 6.07.2023.
//

import UIKit

class SplashViewController: UIViewController {
    
    var isUserLoggedIn:Bool = true
    
    @IBOutlet weak var imageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.addShadow(color: .gray, opacity: 1,offset: CGSize(width: 2, height: 2), radius: 5)
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

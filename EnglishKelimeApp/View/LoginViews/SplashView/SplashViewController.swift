//
//  SplashViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 6.07.2023.
//

import UIKit

class SplashViewController: UIViewController {
    
    var isUserLoggedIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backGround()
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showinitialView()
        }
    }
    
    
    func backGround(){
        
        view.backgroundColor = .systemGreen
    }
    
    
    
}

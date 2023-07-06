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
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showinitialView()

        }
    }
    

    func backGround(){
        
        view.backgroundColor = .systemGreen
    }
    
    private func showinitialView(){
        
        if isUserLoggedIn {
            
            let vc :MainViewController = MainViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.present(vc, animated: true)
            
        } else {
            let vc:OnboardingViewController = OnboardingViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
        
    }
    
    
}

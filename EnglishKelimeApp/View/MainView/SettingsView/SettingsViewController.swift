//
//  SettingsViewController.swift
//  EnglishKelimeApp
//
//  Created by Salih on 5.08.2023.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {


    @IBOutlet weak var loginView: UIVisualEffectView!
    @IBOutlet weak var notificationsView: UIVisualEffectView!
    @IBOutlet weak var memberView: UIVisualEffectView!
    @IBOutlet weak var abautUsView: UIVisualEffectView!
    @IBOutlet weak var privacyView: UIVisualEffectView!
    @IBOutlet weak var logOut: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    private var viewModel = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.delegate = self
        viewModel.checkUserAuthentication()
    }

    func setupView(){
        loginView.layer.cornerRadius = 10
        loginView.clipsToBounds = true
        
        notificationsView.layer.cornerRadius = 10
        notificationsView.clipsToBounds = true
        
        memberView.layer.cornerRadius = 10
        memberView.clipsToBounds = true
        
        abautUsView.layer.cornerRadius = 10
        abautUsView.clipsToBounds = true
        
        privacyView.layer.cornerRadius = 10
        privacyView.clipsToBounds = true
    }


    @IBAction func signInButton(_ sender: UIButton) {
        viewModel.delegate = self
        viewModel.presentLoginViewController()
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        viewModel.signOut()
    }
    
}

extension SettingsViewController:SettingsViewModelDelegate {
    func updateUI(isUserAuthenticated: Bool) {
        DispatchQueue.main.async {
            self.logOut.isHidden = !isUserAuthenticated
            self.signInButton.isHidden = isUserAuthenticated
        }
    }
    
    func presentLoginViewController() {
        DispatchQueue.main.async {
            let vc:LoginViewController = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    func showSignOutPopup() {
        let vc = ErrorViewController()
        vc.animationName = "success"
        vc.descriptionLabels = "Çıkış Yapıldı 😔"
        vc.modalPresentationStyle = .popover
        logOut.isHidden = true
        signInButton.isHidden = false
        self.present(vc, animated: true, completion: nil)

    }
    
    func didSignOutSuccessfully() {
        showSignOutPopup()
    }
}

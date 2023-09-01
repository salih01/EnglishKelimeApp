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
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        print("Kullanılan View\(view.self)")
        
        if let currentUser = Auth.auth().currentUser {
               // Kullanıcı oturum açmışsa "kayıt ol" butonunu gizle
               signInButton.isHidden = true
               logOut.isHidden = false
           } else {
               // Kullanıcı oturum açmamışsa "kayıt ol" butonunu göster
               signInButton.isHidden = false
               logOut.isHidden = true
           }
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
    func showSignOutPopup() {
        let vc = ErrorViewController()
        vc.animationName = "success"
        vc.descriptionLabels = "Çıkış Yapıldı 😔"
        vc.modalPresentationStyle = .popover
        logOut.isHidden = true
        signInButton.isHidden = false
        self.present(vc, animated: true, completion: nil)

    }
    
    func signOut(){
        
        do {
            try Auth.auth().signOut()
                showSignOutPopup()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    @IBAction func signInButton(_ sender: UIButton) {
        print("Tıklandı mı\(view.self)")

        let vc:LoginViewController = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        signOut()
    }
    
}

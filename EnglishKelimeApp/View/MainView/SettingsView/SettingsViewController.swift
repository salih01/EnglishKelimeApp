//
//  SettingsViewController.swift
//  EnglishKelimeApp
//
//  Created by Salih on 5.08.2023.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var loginView: UIVisualEffectView!
    @IBOutlet weak var notificationsView: UIVisualEffectView!
    @IBOutlet weak var memberView: UIVisualEffectView!
    @IBOutlet weak var abautUsView: UIVisualEffectView!
    @IBOutlet weak var privacyView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
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


    
}

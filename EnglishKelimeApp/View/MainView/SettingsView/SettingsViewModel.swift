//
//  SettingsViewModel.swift
//  EnglishKelimeApp
//
//  Created by Salih on 10.11.2023.
//

import Foundation
import FirebaseAuth

protocol SettingsViewModelDelegate:AnyObject {
    func updateUI(isUserAuthenticated: Bool)
    func didSignOutSuccessfully()
    func presentLoginViewController()
    func showSignOutPopup()
}

final class SettingsViewModel {
    
    weak var delegate:SettingsViewModelDelegate?
    var isUserAuthenticated: Bool {
        return Auth.auth().currentUser != nil
    }
    
    func checkUserAuthentication() {
        delegate?.updateUI(isUserAuthenticated: isUserAuthenticated)
    }
    
    func presentLoginViewController() {
        delegate?.presentLoginViewController()
    }
    
    func signOut() {
        do {
            try AuthenticationManager.shared.signOut()
            delegate?.didSignOutSuccessfully()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

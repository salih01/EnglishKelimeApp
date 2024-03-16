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
    var isRealUserLoggedIn: Bool {
        if let currentUser = Auth.auth().currentUser {
            return !currentUser.isAnonymous // Anonim olmayan kullanıcılar için true döner
        }
        return false // Kullanıcı oturum açmamışsa
    }
    
    func checkUserAuthentication() {
        // Delegate üzerinden UI güncelleme
        delegate?.updateUI(isUserAuthenticated: isRealUserLoggedIn)
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

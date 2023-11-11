//
//  SettingsViewModel.swift
//  EnglishKelimeApp
//
//  Created by Salih on 10.11.2023.
//

import Foundation
import FirebaseAuth

protocol SettingsViewModelDelegate:AnyObject {
    func didSignOutSuccessfully()
    func presentLoginViewController()
}

final class SettingsViewModel {
    
    weak var delegate:SettingsViewModelDelegate?
    
    func checkUserAuthentication() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    func presentLoginViewController() {
        delegate?.presentLoginViewController()
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            delegate?.didSignOutSuccessfully()
        } catch {
            print(error.localizedDescription)
        }
    }
    

    
}

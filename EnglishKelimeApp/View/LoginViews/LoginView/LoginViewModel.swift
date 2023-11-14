//
//  LoginViewModel.swift
//  EnglishKelimeApp
//
//  Created by Salih on 13.11.2023.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func showErrors(_ errorMessage: String)
    func showMainView()
}

final class LoginViewModel {
    
    weak var delegate:LoginViewModelDelegate?
    
    func signIn(email:String,password:String) async throws {
        guard !email.isEmpty, !password.isEmpty else {
            delegate?.showErrors("Lütfen alanları boş bırakmayınız")
            return
        }
        
        do {
            try await AuthenticationManager.shared.signIn(email: email, password: password)
            delegate?.showMainView()
        } catch {
            delegate?.showErrors(error.localizedDescription)
        }
    }
}

//
//  SignUpViewModel.swift
//  EnglishKelimeApp
//
//  Created by Salih on 9.11.2023.
//

import Foundation
import FirebaseAuth
protocol SignUpViewModelDelegate: AnyObject {
    func showErrors(_ errorMessage: String)
}

final class SignInEmailViewModel {
    
    weak var delegate: SignUpViewModelDelegate?
    var email = ""
    var password = ""
    var repeatedPassword = ""
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty, password == repeatedPassword else {
            delegate?.showErrors("Lütfen alanları boş bırakmayınız")
            return
        }
        guard password == repeatedPassword else {
            delegate?.showErrors("Girilen şifreler aynı değil . Lütfen tekrar deneyiniz")
            return
        }
        
        do {
            try await AuthenticationManager.shared.createUser(email: email, password: password)
        } catch {
            delegate?.showErrors(error.localizedDescription)
        }
    }
}

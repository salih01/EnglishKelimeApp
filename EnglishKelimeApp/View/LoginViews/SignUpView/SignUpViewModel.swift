//
//  SignUpViewModel.swift
//  EnglishKelimeApp
//
//  Created by Salih on 9.11.2023.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

protocol SignUpViewModelDelegate: AnyObject {
    func showErrors(_ errorMessage: String)
    func onSuccessfulSignIn()
    func getPresentingViewController() -> UIViewController
}


final class SignInEmailViewModel {
    
    weak var delegate: SignUpViewModelDelegate?

    
    func signIn(email: String, password: String, repeatedPassword: String) async throws {
        guard !email.isEmpty, !password.isEmpty else {
            delegate?.showErrors("Lütfen alanları boş bırakmayınız")
            return
        }
        guard password == repeatedPassword else {
            delegate?.showErrors("Girilen şifreler aynı değil . Lütfen tekrar deneyiniz")
            return
        }
        
        do {
            try await AuthenticationManager.shared.createUser(email: email, password: password)
            delegate?.onSuccessfulSignIn()
        } catch {
            delegate?.showErrors(error.localizedDescription)
        }
    }
    
    func signInGoogle() async throws {
        
        guard let presentingViewController = delegate?.getPresentingViewController() else {
            // Hata yönetimi - uygun ViewController bulunamadı
            return
        }
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController)


        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
              throw URLError(.badServerResponse)
        }
        let accessToken = gidSignInResult.user.accessToken.tokenString
        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)
        
        do {
              try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
                delegate?.onSuccessfulSignIn()
          } catch {
              delegate?.showErrors(error.localizedDescription)
          }
        
    }
}



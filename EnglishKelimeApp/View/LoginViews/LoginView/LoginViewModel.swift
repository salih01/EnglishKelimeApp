//
//  LoginViewModel.swift
//  EnglishKelimeApp
//
//  Created by Salih on 13.11.2023.
//

import Foundation
import UIKit
import GoogleSignIn
import GoogleSignInSwift

protocol LoginViewModelDelegate: AnyObject {
    func showErrors(_ errorMessage: String)
    func onSuccessfulSignIn()
    func getPresentingViewController() -> UIViewController
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

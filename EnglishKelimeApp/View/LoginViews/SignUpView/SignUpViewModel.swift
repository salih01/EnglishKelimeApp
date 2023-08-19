//
//  SignUpViewModel.swift
//  EnglishKelimeApp
//
//  Created by Salih on 19.08.2023.
//

import Foundation
import FirebaseAuth
protocol signUpviewModelDelegate {
    func createUser(email: String, password: String)
}

class SignUpViewModel:signUpviewModelDelegate {
    
    func createUser(email: String, password: String) {
      Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        guard error == nil else { return print("Kullanıcı oluşturulurken alınan hata : \(error)") }
       // self.delegate?.loginDidOccur()
      }
    }
    
    
}

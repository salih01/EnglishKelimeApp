//
//  AuthenticationManager.swift
//  EnglishKelimeApp
//
//  Created by Salih on 9.11.2023.
//

import Foundation
import FirebaseAuth


final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private init(){}
    
    // MARK: - GET USER
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    
    
    // MARK: - CREATE USER WITH FİREBASE 🔥
    func createUser(email:String,password:String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        print("*** Oluşturulan Kullanıcı -> \(authDataResult)")
        return AuthDataResultModel(user: authDataResult.user)
    }
    
}

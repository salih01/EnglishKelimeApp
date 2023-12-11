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
        print("*** Oluşturulan Kullanıcı -> \(authDataResult.user)")
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    // MARK: -  SIGN IN WITH EMAIL
    func signIn(email:String,password:String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        print("*** Giriş Yapan Kullanıcı -> \(authDataResult)")
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    // MARK: -  SIGN OUT
    func signOut() throws {
       try Auth.auth().signOut()
    }
    
}

// MARK: -  Sign In SSO
extension AuthenticationManager {
    
    func signInWithGoogle(tokens:GoogleSignInResultModel) async throws -> AuthDataResultModel {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        
        return try await signIn(credential: credential)
    }
    
    func signIn(credential:AuthCredential) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(with: credential)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
}

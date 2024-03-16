//
//  MainViewModel.swift
//  EnglishKelimeApp
//
//  Created by Salih on 1.01.2024.
//

import Foundation

class MainViewModel {
    
    func signInAnonymous() async throws{
        try await AuthenticationManager.shared.signInAnonymouslyIfNeeded()
    }
}

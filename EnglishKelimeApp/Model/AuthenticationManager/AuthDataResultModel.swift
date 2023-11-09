//
//  AuthDataResultModel.swift
//  EnglishKelimeApp
//
//  Created by Salih on 9.11.2023.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid:String?
    let email:String?
    let photoURL:String?
    let isAnonymous:Bool?
    
    init(user: User) {
        self.uid         = user.uid
        self.email       = user.email
        self.photoURL    = user.photoURL?.absoluteString
        self.isAnonymous = user.isAnonymous
    }
}

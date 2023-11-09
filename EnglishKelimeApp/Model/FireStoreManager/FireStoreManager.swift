//
//  FireStoreManager.swift
//  EnglishKelimeApp
//
//  Created by Salih on 29.10.2023.
//

import Foundation
import FirebaseFirestore

class FirestoreManager {
    static let shared = FirestoreManager()
    let db = Firestore.firestore()

    func getAllData(completion: @escaping ([String: Any]?) -> Void) {
        let allDataRef = db.collection("AllData").document()

        allDataRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Firestore veri alma hatası: \(error)")
                completion(nil)
            } else if let documents = querySnapshot?.documents {
                if let firstDocument = documents.first {
                    // İlk belgeyi kullanabilirsiniz
                    completion(firstDocument.data())
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
}

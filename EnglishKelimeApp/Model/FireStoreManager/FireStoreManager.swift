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

    func get1to10Data(completion: @escaping ([String: Any]?) -> Void) {
        let documentName = "1-100" // Örnek bir belge adı
        let dataRef = db.collection("AllData").document(documentName).collection("Data1-100").document("1-10")

        dataRef.getDocument { (document, error) in
            if let error = error {
                print("Firestore veri alma hatası: \(error)")
                completion(nil)
            } else if let document = document, document.exists {
                if let data = document.data() {
                    // "1-10" koleksiyonundan gelen veriler ile burada çalışabilirsiniz
                    completion(data)
                }
            }
        }
    }
}

//
//  Helper.swift
//  EnglishKelimeApp
//
//  Created by Salih on 10.07.2023.
//

import Foundation


func delay(durationInSeconds seconds:Double, completion:@escaping () -> Void){
    
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
    
}

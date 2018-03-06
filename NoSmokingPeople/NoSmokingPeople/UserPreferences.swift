//
//  UserPreferences.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2018. 2. 14..
//  Copyright © 2018년 김재희. All rights reserved.
//

import Foundation

let userPreferences = UserDefaults.standard

class UserPreferences {
    
    func hello(){
        // 저장
        userPreferences.setValue(2, forKey: "year")
        
        // 불러오기
        let value = userPreferences.integer(forKey: "year")
        
        if userPreferences.object(forKey: "year") == nil {
            // 없는거
        }
    }
}

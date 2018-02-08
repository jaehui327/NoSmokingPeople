//
//  Extension.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2017. 8. 8..
//  Copyright © 2017년 김재희. All rights reserved.
//

import UIKit
//헥사코드 사용 가능
extension UIColor{
    convenience init(hex: Int, alpha: CGFloat = 1.0){
        
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat((hex & 0x0000FF) >> 0) / 255.0,
            
            alpha : alpha
        )
    }
}

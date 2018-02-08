//
//  MyCustomTextField.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2018. 2. 8..
//  Copyright © 2018년 김재희. All rights reserved.
//

import Foundation
import UIKit

class MyCustomTextField : UITextField {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 3.0
    }
}

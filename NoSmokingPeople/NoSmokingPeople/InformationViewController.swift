//
//  InformationViewController.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2018. 2. 28..
//  Copyright © 2018년 김재희. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImage(named: "invalidName")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        // Do any additional setup after loading the view.
    }


}

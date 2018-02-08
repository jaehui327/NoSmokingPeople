//
//  Manual3_ViewController.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2017. 7. 29..
//  Copyright © 2017년 김재희. All rights reserved.
//

import UIKit

class Manual3_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImage(named: "invalidName")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView

        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        // Do any additional setup after loading the view.
    }

}

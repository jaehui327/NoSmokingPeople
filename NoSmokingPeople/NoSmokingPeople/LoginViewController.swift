//
//  LoginViewController.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2017. 7. 21..
//  Copyright © 2017년 김재희. All rights reserved.
//

import UIKit
import KYDrawerController

class LoginViewController: UIViewController {
    
    let drawerController = KYDrawerController(drawerDirection: .left, drawerWidth: 240)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func gotoHomeView(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainTab")
        let menuVC = storyboard.instantiateViewController(withIdentifier: "Drawer")
        
        drawerController.mainViewController = mainVC
        drawerController.drawerViewController = menuVC
        
        self.present(drawerController, animated: true, completion: nil)
    }
}

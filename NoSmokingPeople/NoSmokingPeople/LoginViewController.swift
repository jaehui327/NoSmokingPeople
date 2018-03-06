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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.delay(0.5){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let smokingVC = storyboard.instantiateViewController(withIdentifier: "smokingCheck")
            if UserDefaults.standard.object(forKey: "name") != nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let mainVC = storyboard.instantiateViewController(withIdentifier: "MainTab")
                let menuVC = storyboard.instantiateViewController(withIdentifier: "Drawer")
                
                self.drawerController.mainViewController = mainVC
                self.drawerController.drawerViewController = menuVC
                
                self.present(self.drawerController, animated: true, completion: nil)
            }
            else{ self.present(smokingVC, animated: true, completion: nil) }
        }

    }
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
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

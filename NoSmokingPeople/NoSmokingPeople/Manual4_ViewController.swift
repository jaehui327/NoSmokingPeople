//
//  Manual4_ViewController.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2017. 7. 29..
//  Copyright © 2017년 김재희. All rights reserved.
//

import UIKit
import KYDrawerController

class Manual4_ViewController: UIViewController {

    let drawerController = KYDrawerController(drawerDirection: .left, drawerWidth: 240)
    
    @IBAction func gotoHomeViewController(_ sender: Any) {
        
//        let nvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTab")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainTab")
        let menuVC = storyboard.instantiateViewController(withIdentifier: "Drawer")
        
        drawerController.mainViewController = mainVC
        drawerController.drawerViewController = menuVC
        
        self.present(drawerController, animated: true, completion: nil)
    }
 
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

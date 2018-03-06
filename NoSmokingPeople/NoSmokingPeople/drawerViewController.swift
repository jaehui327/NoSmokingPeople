//
//  drawerViewController.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2018. 2. 2..
//  Copyright © 2018년 김재희. All rights reserved.
//

import UIKit
import KYDrawerController

class drawerViewController: UIViewController {

    let app = UserDefaults.standard
    
    @IBOutlet weak var UserName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = app.object(forKey: "name") as? String {
            UserName.text = name + " 님"
        }
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func showWrittenOath(_ sender: Any) {
        if let parent = self.parent as? KYDrawerController,
            let tabbar = parent.mainViewController as? UITabBarController,
            let current = tabbar.selectedViewController as? UINavigationController {
            
            parent.setDrawerState(.closed, animated: true)
            
            DispatchQueue.main.async {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = sb.instantiateViewController(withIdentifier: "WrittenOathViewController") as? WrittenOathViewController else { return }
//                vc.hideStartButton()
                vc.textFix()
                current.pushViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func showManual(_ sender: Any) {
        if let parent = self.parent as? KYDrawerController,
            let tabbar = parent.mainViewController as? UITabBarController,
        let current = tabbar.selectedViewController as? UINavigationController {
            
            parent.setDrawerState(.closed, animated: true)
            
            DispatchQueue.main.async {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = sb.instantiateViewController(withIdentifier: "Root") as? RootPageViewController else { return }
                vc.hideStartButton()
                current.pushViewController(vc, animated: true)
            }
        }
    }
    @IBAction func showInquiry(_ sender: Any) {
        if let parent = self.parent as? KYDrawerController,
            let tabbar = parent.mainViewController as? UITabBarController,
            let current = tabbar.selectedViewController as? UINavigationController {
            
            parent.setDrawerState(.closed, animated: true)
            
            DispatchQueue.main.async {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = sb.instantiateViewController(withIdentifier: "inquiry") as? InquiryViewController else { return }
                current.pushViewController(vc, animated: true)
            }
        }
    }
    @IBAction func showSetting(_ sender: Any) {
        if let parent = self.parent as? KYDrawerController,
            let tabbar = parent.mainViewController as? UITabBarController,
            let current = tabbar.selectedViewController as? UINavigationController {
            
            parent.setDrawerState(.closed, animated: true)
            
            DispatchQueue.main.async {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = sb.instantiateViewController(withIdentifier: "setting") as? SettingViewController else { return }
                current.pushViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func showInformation(_ sender: Any) {
        
        if let parent = self.parent as? KYDrawerController,
            let tabbar = parent.mainViewController as? UITabBarController,
            let current = tabbar.selectedViewController as? UINavigationController {
            
            parent.setDrawerState(.closed, animated: true)
            
            DispatchQueue.main.async {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = sb.instantiateViewController(withIdentifier: "information") as? InformationViewController else { return }
                current.pushViewController(vc, animated: true)
            }
        }
    }
    
}






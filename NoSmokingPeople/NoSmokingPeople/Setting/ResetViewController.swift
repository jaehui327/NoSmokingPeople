//
//  ResetViewController.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2018. 3. 5..
//  Copyright © 2018년 김재희. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController {
    
    
    @IBOutlet weak var popupView: UIView!
    
    @IBOutlet weak var doneButton: UIButton! {
        didSet {
            doneButton.addTarget(self, action: #selector(doneButtonDidTapped(_:)), for: .touchUpInside)
        }
    }
    @IBOutlet weak var cancelButton: UIButton! {
        didSet {
            cancelButton.addTarget(self, action: #selector(cancelButtonDidTapped(_:)), for: .touchUpInside)
        }
    }
    
    
    @objc private func doneButtonDidTapped(_ sender: UIButton) {
        self.deleteUserDefaults()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let smokingVC = storyboard.instantiateViewController(withIdentifier: "smokingCheck")
        self.present(smokingVC, animated: true, completion: nil)
    }
    
    @objc private func cancelButtonDidTapped(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    func deleteUserDefaults() {
        let appDomain = Bundle.main.bundleIdentifier
        UserDefaults.standard.removePersistentDomain(forName: appDomain!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.clear.withAlphaComponent(0.3)
        self.view.isOpaque = false
        
        popupView.layer.masksToBounds = false
        popupView.layer.cornerRadius = 10.0
        
        let borderWidth: CGFloat = 1.0
        let borderColor : UIColor =  UIColor.lightGray
        doneButton.addTopBorderWithColor(color: borderColor, width: borderWidth)
//        cancelButton.addLeftBorderWithColor(color: borderColor, width: borderWidth)
        cancelButton.addTopBorderWithColor(color: borderColor, width: borderWidth)
        
        // Do any additional setup after loading the view.
    }
    
}

extension UIView {
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0,y: 0, width:self.frame.size.width, height:width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width,y: 0, width:width, height:self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:self.frame.size.height - width, width:self.frame.size.width, height:width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:0, width:width, height:self.frame.size.height)
        self.layer.addSublayer(border)
    }
}


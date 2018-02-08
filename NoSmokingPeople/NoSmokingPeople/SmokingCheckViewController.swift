//
//  SmokingCheckViewController.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2017. 7. 20..
//  Copyright © 2017년 김재희. All rights reserved.
//

import UIKit

class SmokingCheckViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var SmokingCheckView: UIView!
    
    @IBOutlet weak var SYTextField: UITextField!
    @IBOutlet weak var SNTextField: UITextField!
    @IBOutlet weak var SPTextField: UITextField!
    
    @IBOutlet weak var signUpBtn: UIBarButtonItem!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
         observeKeyBoardNotification()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector:#selector(textChanged(sender:)), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        signUpBtn.isEnabled = false
        
        let logo = UIImage(named: "invalidName")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        
        SYTextField.delegate = self
        SNTextField.delegate = self
        SPTextField.delegate = self
    }
    
    func textChanged(sender:NSNotification){
        if (SYTextField.hasText && SNTextField.hasText && SPTextField.hasText) { signUpBtn.isEnabled = true }
        else { signUpBtn.isEnabled = false }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SYTextField.resignFirstResponder()
        SNTextField.resignFirstResponder()
        SPTextField.resignFirstResponder()
        return true
    }

    @IBAction func viewDidTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}


extension SmokingCheckViewController{
//    fileprivate
    func observeKeyBoardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
//    func adjustingHeight(show:Bool, notification:NSNotification) {
//        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
//        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
//        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
//        let keyboardRectangle = keyboardFrame.cgRectValue
//        let keyboardHeight = keyboardRectangle.height
//        let changeInHeight = (keyboardHeight + 40) * (show ? 1 : -1)
//        UIView.animate(withDuration: animationDurarion, animations: {self.bottomConstraint.constant += changeInHeight})
//    }
//
//    func keyboardShow(notification:NSNotification) {
//        adjustingHeight(show: true, notification: notification)
//    }
//
//    func keyboardHide(notification:NSNotification) {
//        adjustingHeight(show: false, notification: notification)
//    }



    func keyboardHide(){
        //        self.view.frame.height
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping:1, initialSpringVelocity: 1 ,options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x:0, y:0, width:self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }

    func keyboardShow(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1 ,options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x:0, y:-120, width:self.view.frame.width, height:self.view.frame.height)
        }, completion: nil)
    }
    
}

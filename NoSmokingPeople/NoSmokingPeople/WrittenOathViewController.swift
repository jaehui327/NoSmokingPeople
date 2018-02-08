//
//  WrittenOathViewController.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2017. 7. 20..
//  Copyright © 2017년 김재희. All rights reserved.
//

import UIKit

class WrittenOathViewController: UIViewController, UITextFieldDelegate {
  

    @IBOutlet weak var WrittenOathView: UIView!

    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var DateTextField: UITextField!
    
    
    @IBOutlet weak var signUpBtn: UIBarButtonItem!
    
    
    @IBAction func textFieldEditingDidChange(sender: UITextField) {
        print("dateField: \(DateTextField.text!)")
        
        if (NameTextField.hasText){ signUpBtn.isEnabled = true }
        else { signUpBtn.isEnabled = false }
        
        if ((DateTextField.text) != nil) { DateTextField.backgroundColor = UIColor(hex: 0x98B9C9) }
        else { DateTextField.backgroundColor = UIColor.white }
    }
    
    
    @IBAction func DatetextFieldEditing(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePickerView
        let today = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        DateTextField.text = dateFormatter.string(from: today as Date)
        datePickerView.addTarget(self, action: #selector(WrittenOathViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        DateTextField.text = dateFormatter.string(from: sender.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        NotificationCenter.default.addObserver(self, selector:#selector(textChanged(sender:)), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        signUpBtn.isEnabled = false
  
        let logo = UIImage(named: "invalidName")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView

        NameTextField.delegate = self
        DateTextField.delegate = self
        
        }
    
    func textChanged(sender:NSNotification){
        if (NameTextField.hasText && DateTextField.hasText){
            signUpBtn.isEnabled = true
        } else{
            signUpBtn.isEnabled = false
        }
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NameTextField.resignFirstResponder()
        DateTextField.resignFirstResponder()
        return true
    }

    @IBAction func viewDidTapped(_ sender: Any) {
        view.endEditing(true)
    }
    

}

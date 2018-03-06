//
//  WrittenOathViewController.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2017. 7. 20..
//  Copyright © 2017년 김재희. All rights reserved.
//

import UIKit

class WrittenOathViewController: UIViewController, UITextFieldDelegate {
  
    var filledtextField:Bool = false
    
    let app = UserDefaults.standard

    @IBOutlet weak var WrittenOathView: UIView!

    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var DateTextField: UITextField!
    
    
    @IBOutlet weak var signUpBtn: UIBarButtonItem!
    
    var date:Date? // 저장될 날짜
    
    
    @IBAction func textFieldEditingDidChange(sender: UITextField) {
        print("dateField: \(DateTextField.text!)")
        
        if (NameTextField.hasText){ signUpBtn.isEnabled = true }
        else { signUpBtn.isEnabled = false }
        
        if ((DateTextField.text) != nil) { DateTextField.backgroundColor = UIColor(hex: 0x98B9C9) }
        else { DateTextField.backgroundColor = UIColor.white }
    }
    
    
    @IBAction func DatetextFieldEditing(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        let locale = NSLocale(localeIdentifier: "ko_KO")
        datePickerView.locale = locale as Locale
        datePickerView.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePickerView
        let today = Date()
        date = today
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        DateTextField.text = dateFormatter.string(from: today as Date)
        datePickerView.addTarget(self, action: #selector(WrittenOathViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    
    func addToolBar(textField: UITextField){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 98 / 255, green: 150 / 255, blue: 174 / 255, alpha: 1)
        let doneButton = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(donePressed))
        doneButton.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor(red: 98 / 255, green: 150 / 255, blue: 174 / 255, alpha: 1)], for: .normal)
        let spaceBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceBtn, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.delegate = self
        textField.inputAccessoryView = toolBar
    }
    
    func donePressed() {
        //      self.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        DateTextField.text = dateFormatter.string(from: sender.date)
        date = sender.date
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
        
        addToolBar(textField: NameTextField)
        addToolBar(textField: DateTextField)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        if filledtextField{
            NameTextField.text = UserDefaults.standard.string(forKey: "name")
//            let userdate = UserDefaults.standard.string(forKey: "date")
            if let userdate = app.object(forKey: "date") as? Date{
                date = userdate
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy년 MM월 dd일"
                DateTextField.text = dateFormatter.string(from: userdate as Date)
                DateTextField.textColor = UIColor(hex: 0x6296AE, alpha: 1)
            }
            let signUp = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
            navigationItem.rightBarButtonItem = signUp
            NameTextField.isUserInteractionEnabled = false
            DateTextField.isUserInteractionEnabled = false
//            tabBarController?.tabBar.isHidden = true
        }
    }
    
    func textFix(){
        filledtextField = true
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue)
        if segue.identifier == "manualsegue" {
            guard let vc = segue.destination as? RootPageViewController else { return }
            vc.hideBackButton()
//            userPreferences.setValue(String(DateTextField.text!), forKey: "date")
            if let date = self.date {
                userPreferences.set(date, forKey: "date")
            }
            userPreferences.setValue(String(NameTextField.text!), forKey: "name")
        }
    }
    
    
}

//
//  InquiryViewController.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2018. 2. 22..
//  Copyright © 2018년 김재희. All rights reserved.
//

import UIKit
import Alamofire
import Toaster

class InquiryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inquiryTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton! {
        didSet {
            sendButton.addTarget(self, action: #selector(sendButtonDidTapped(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func sendButtonDidTapped(_ sender: UIButton) {
        if let text = inquiryTextField.text, text != "" {
            FeedBack.sendMsg(msg: text, completionHandler: { result in
                if result {
                    // 성공했을 경우
                    print("errormsg success")
                    self.inquiryTextField.resignFirstResponder()
                    DispatchQueue.main.async {
                        Toast(text: "문의사항이 접수되었습니다.").show()
                        self.navigationController?.popViewController(animated: true)
                    }
                } else {
                    // 실패했을 경우
                    print("errormsg failed")
                    self.inquiryTextField.resignFirstResponder()
                    Toast(text: "전송에 실패했습니다.\n다시 시도하세요.").show()
                }
            })
        } else {
            // 입력해주세요
            self.inquiryTextField.resignFirstResponder()
            Toast(text: "문의사항을 입력해주세요.").show()
        }
       
        //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //        let smokingVC = storyboard.instantiateViewController(withIdentifier: "smokingCheck")
        //        self.present(smokingVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector:#selector(textChanged(sender:)), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        
        let logo = UIImage(named: "invalidName")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        
        inquiryTextField.delegate = self
        
        inquiryTextField.layer.shadowColor = UIColor.clear.cgColor
        inquiryTextField.layer.cornerRadius = 0
        inquiryTextField.layer.masksToBounds = true
        inquiryTextField.layer.borderWidth = 1.0
        inquiryTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        sendButton.layer.cornerRadius = 5
//        sendButton.layer.shadowColor = UIColor.black.cgColor
        sendButton.layer.masksToBounds = false
//        sendButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
//        sendButton.layer.shadowOpacity = 0.5
//        sendButton.layer.shadowRadius = 3.0
        
        addToolBar(textField: inquiryTextField)
    }
    
    func textChanged(sender:NSNotification){
//        if (NameTextField.hasText && DateTextField.hasText){
//            signUpBtn.isEnabled = true
//        } else{
//            signUpBtn.isEnabled = false
//        }
    }
    
    @IBAction func viewDidTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inquiryTextField.resignFirstResponder()
        return true
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
    
    

}

class FeedBack {
    
    // URL은 git public repository에 올리면 안됩니다!
    
    // 사용 예시
    //    FeedBack.sendMsg(msg: "문의 내용", completionHandler: { result in
    //        if result {
    //        // 성공했을 경우
    //        } else {
    //        // 실패했을 경우
    //        }
    //    })
    
    static func sendMsg(msg: String, completionHandler: @escaping (_ Result:Bool) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        let systemVersion = UIDevice.current.systemVersion // OS 버전
        let device = UIDevice.current.modelName // 기기 모델명
        
        var params: Parameters = [
            "msg": msg, // 문의하기 내용
            "device": "\(device) \(systemVersion)" // 기기명, OS 버전
        ]
        if let bundleID = Bundle.main.bundleIdentifier {
            // 옵셔널 해제 성공할 경우만 값 담기
            // 강제 해제해도 되지만 비강제 해제를 습관화합시다!
            params["service"] = bundleID
        }
        // 학번 정보를 저장하고 있다면 추가! 아마 없을거에요!
        //        if let sno = 학번 {
        //            params["sno"] = sno
        //        }
        
        Alamofire.request(MSG_URL, method: .post, parameters: params, headers: headers).response { res in
            if let code = res.response?.statusCode, code == 200 {
                // 성공
                completionHandler(true)
            } else {
                // 실패
                completionHandler(false)
            }
        }
    }
}

public extension UIDevice {
    // 수정하지 말 것!
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
        case "AppleTV5,3":                              return "Apple TV"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "AudioAccessory1,1":                       return "HomePod"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
}











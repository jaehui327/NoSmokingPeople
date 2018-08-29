//
//  HomeViewController.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2017. 8. 2..
//  Copyright © 2017년 김재희. All rights reserved.
//

import UIKit
import KYDrawerController

class HomeViewController: UIViewController {

    var timer:Timer?
    
    let app = UserDefaults.standard
    
    var days:Int? = nil
    
    @IBOutlet weak var HomeCollectionView: UICollectionView!
    
    @IBOutlet weak var HomeProgress: UIProgressView!
    @IBOutlet weak var GoalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
//        let date = Date()
//        app.set(date, forKey: "date")
        
        let logo = UIImage(named: "invalidName")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        
        self.HomeCollectionView.dataSource = self
        self.HomeCollectionView.delegate = self
        
        if getsecond()! < 86400.0{
            GoalLabel.text = "1일"
            HomeProgress.setProgress(Float(getsecond()!/86400.0), animated: true)
        }
        else if getsecond()! < 259200.0 {
            GoalLabel.text = "3일"
            HomeProgress.setProgress(Float(getsecond()!/259200.0), animated: true)
        }
        else if getsecond()! < 604800.0 {
            GoalLabel.text = "7일"
            HomeProgress.setProgress(Float(getsecond()!/604800.0), animated: true)
        }
        else if getsecond()! < 1209600.0 {
            GoalLabel.text = "14일"
            HomeProgress.setProgress(Float(getsecond()!/1209600.0), animated: true)
        }
        else if getsecond()! < 1814400.0 {
            GoalLabel.text = "21일"
            HomeProgress.setProgress(Float(getsecond()!/1814400.0), animated: true)
        }
        else if getsecond()! < 1814400.0 {
            GoalLabel.text = "21일"
            HomeProgress.setProgress(Float(getsecond()!/1814400.0), animated: true)
        }
        else if getsecond()! < 8640000.0 {
            GoalLabel.text = "100일"
            HomeProgress.setProgress(Float(getsecond()!/8640000.0), animated: true)
        }
        else if getsecond()! < 17280000.0 {
            GoalLabel.text = "200일"
            HomeProgress.setProgress(Float(getsecond()!/17280000.0), animated: true)
        }
        else if getsecond()! < 31536000.0 {
            GoalLabel.text = "365일"
            HomeProgress.setProgress(Float(getsecond()!/31536000.0), animated: true)
        }
        else if getsecond()! < 63072000.0 {
            GoalLabel.text = "2년"
            HomeProgress.setProgress(Float(getsecond()!/63072000.0), animated: true)
        }
        else {
            GoalLabel.text = "5년"
            HomeProgress.setProgress(Float(getsecond()!/157680000.0), animated: true)
        }

//        let imgIcon = UIImage(named: "btnMenu")?.withRenderingMode(.alwaysOriginal)
//        let leftbarButton = UIBarButtonItem(image: imgIcon, style: .plain, target: self, action: nil)
//        self.navigationItem.leftBarButtonItem = leftbarButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setTimer), userInfo: nil, repeats: true)
    }

    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
        timer = nil
    }
    
    func setTimer () {
        
//        cell.subtitle.text = "\(timeString)"
//        HomeCollectionView.reloadItems(at: [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0), IndexPath(row: 2, section: 0), IndexPath(row: 3, section: 0)])
        
        for i in 0..<4 {
            guard let cell = HomeCollectionView.cellForItem(at: IndexPath(row: i, section: 0)) as? HomeCollectionViewCell else { return }
            var text = ""
            switch i {
            case 0:
                if let str = getTime() { text = str }
            case 1:
                if let str = getLife() { text = str }
            case 2:
                if let str = getprice() { text = str }
            case 3:
                if let str = getnumber() { text = str }
            default:
                print()
            }
            cell.subtitle.text = text
        }
    }
    
    func getsecond() -> Double? {
        if let date2 = app.object(forKey: "date") as? Date {
            let interval = -(date2.timeIntervalSinceNow)
            return interval
        }
        return nil
    }
    
    func getTime() -> String? {
        if let date2 = app.object(forKey: "date") as? Date {
            let interval = -(date2.timeIntervalSinceNow)
            return stringFromTimeInterval(interval: interval)
        }
        return nil
    }
    
    func getLife() -> String? {
        if let date2 = app.object(forKey: "date") as? Date {
            let interval = -(date2.timeIntervalSinceNow) * 0.297
            return stringFromTimeInterval(interval: interval)
        }
        return nil
    }
    func stringFromTimeInterval(interval: TimeInterval) -> String {
        let ti = NSInteger(interval)
        //        let ms = Int((interval.truncatingRemainder(dividingBy: 1)) * 1000)
        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        let hours = (ti / 3600) % 24
        
        let days = (ti / 86400)
        
        return String(format: "%0.2d일 %0.2d시간 %0.2d분 %0.2d초",days,hours,minutes,seconds)
    }
    
    func getprice() -> String? {
        if let date2 = app.object(forKey: "date") as? Date {
            let interval = -(date2.timeIntervalSinceNow)
            return priceFromTimeInterval(interval: interval)
        }
        return nil
    }
    func priceFromTimeInterval(interval: TimeInterval) -> String? {
        let ti = Double(interval)
        if let y = app.object(forKey: "number") as? Double {
            let number = ti * y / 86400.0
            if let z = app.object(forKey: "price") as? Double {
                let price = number * z / 20
                //            print(price)
                //            print(ti)
                return String(format: "%0.1f원",price)
            }
        }
        return nil
    }

    func getnumber() -> String? {
        if let date2 = app.object(forKey: "date") as? Date {
            let interval = -(date2.timeIntervalSinceNow)
            return numberFromTimeInterval(interval: interval)
        }
        return nil
    }
    func numberFromTimeInterval(interval: TimeInterval) -> String? {
        let ti = Double(interval)
        if let y = app.object(forKey: "number") as? Double {
            let number = ti * y / 86400.0
            return String(format: "%0.1f개비", number)
        }
        return nil
    }
   
    @IBAction func btnPressed(_ sender: Any) {
        if let drawer = tabBarController?.parent as? KYDrawerController {
            drawer.setDrawerState(.opened, animated: true)
        }
    }
    
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell", for: indexPath) as! HomeCollectionViewCell
        switch indexPath.row {
        case 0:
            cell.imageSign.image = UIImage(named: "imgSign1")
            cell.maintitle.text = "금연중"
            if let timeString = getTime() {
                cell.subtitle.text = timeString
            }
            break
        case 1:
            cell.imageSign.image = UIImage(named: "imgSign2")
            cell.maintitle.text = "수명연장"
            if let timeString = getLife(){
                cell.subtitle.text = timeString
            }
            break
        case 2:
            cell.imageSign.image = UIImage(named: "imgSign3")
            cell.maintitle.text = "절약한 담배값"
            if let priceString = getprice(){
                cell.subtitle.text = priceString
            }
            break
        case 3:
            cell.imageSign.image = UIImage(named: "imgSign4")
            cell.maintitle.text = "안피운 담배개비"
            if let numberString = getnumber(){
                cell.subtitle.text = numberString
            }
          break
        default:
            break
        }
        
        cell.layer.cornerRadius = 3
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowRadius = 1
        
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width - 30 , height: 60)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Get frame width
        let width = self.view.frame.width
        //I want a width of 418 and height of 274 (Aspect ratio 209:137) with a margin of 24 on each side of the cell (See insetForSectionAt 24 + 24 = 48). So, check if a have that much screen real estate.
        if width > (344 + 32) {
            //If I do return the size I want
            return CGSize(width: 343, height: 60)
        }else{
            //Get new width. Frame width minus the margins I want to maintain
            let newWidth = (width - 32)
            //If not calculate the new height that maintains the aspect ratio I want. NewHeight = (originalHeight / originalWidth) * newWidth
//            let height = (60 / 343) * newWidth
            //Return the new size that is Aspect ratio 209:137
            return CGSize(width: newWidth, height: 60)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 5, left: 16, bottom: 5, right: 16)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
}

extension UITabBar {
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        guard let window = UIApplication.shared.keyWindow else {
            return super.sizeThatFits(size)
        }
        var sizeThatFits = super.sizeThatFits(size)
        if #available(iOS 11.0, *) {
            sizeThatFits.height = window.safeAreaInsets.bottom + 56
        } else {
            // Fallback on earlier versions
            sizeThatFits.height = 56
        }
        return sizeThatFits
    }
}











//
//  HealthViewController.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2017. 8. 9..
//  Copyright © 2017년 김재희. All rights reserved.
//

import UIKit
import KYDrawerController

class HealthViewController: UIViewController {
    
    var timer:Timer?
    
    let app = UserDefaults.standard
    

    @IBOutlet weak var HealthCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImage(named: "invalidName")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        
        self.HealthCollectionView.delegate = self
        self.HealthCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setTimer), userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
        timer = nil
    }
    func setTimer () {
        //        guard let cell = HomeCollectionView.cellForItem(at: IndexPath(row: 0, section: 0)) as? HomeCollectionViewCell, let timeString = getTime() else { return }
        //        cell.subtitle.text = "\(timeString)"
        for j in 0..<1 {
            for i in 0..<3{
                guard let cell = HealthCollectionView.cellForItem(at: IndexPath(row: i, section: j)) as? HealthCollectionViewCell else { return }
                switch j {
                case 0:
                    switch i {
                    case 0:
                        if let second = getTime() { cell.progressView.setProgress(Float(second/1200), animated: false) }
                    case 1:
                        if let second = getTime() { cell.progressView.setProgress(Float(second/43200), animated: false) }
                    case 2:
                        if let second = getTime() { cell.progressView.setProgress(Float(second/1209600), animated: false) }
                    case 3:
                        if let second = getTime() { cell.progressView.setProgress(Float(second/3024000), animated: false) }
                    default:
                        print()
                    }
                case 1:
                    switch i {
                    case 0:
                        if let second = getTime() { cell.progressView.setProgress(Float(second/86400), animated: false) }
                    case 1:
                        if let second = getTime() { cell.progressView.setProgress(Float(second/259200), animated: false) }
                    case 2:
                        if let second = getTime() { cell.progressView.setProgress(Float(second/604800), animated: false) }
                    default: print()
                    }
                default: print()
                }
            }
        }
    }
    
    func getTime() -> Double? {
        if let date2 = app.object(forKey: "date") as? Date {
            let interval = -(date2.timeIntervalSinceNow)
            return interval
        }
        return nil
    }
    
    func getprice() -> Double? {
        if let date2 = app.object(forKey: "date") as? Date {
            let interval = -(date2.timeIntervalSinceNow)
            return priceFromTimeInterval(interval: interval)
        }
        return nil
    }
    func priceFromTimeInterval(interval: TimeInterval) -> Double? {
        let ti = Double(interval)
        if let y = app.object(forKey: "number") as? Double {
            let number = ti * y / 86400.0
            if let z = app.object(forKey: "price") as? Double {
                let price = number * z / 20
                //            print(price)
                //            print(ti)
                return price
            }
        }
        return nil
    }
    
    @IBAction func btnMenuPressed(_ sender: Any) {
        if let drawer = tabBarController?.parent as? KYDrawerController {
            drawer.setDrawerState(.opened, animated: true)
        }
    }
}

extension HealthViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        default:
            return 3
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HealthHeaderCollectionCell", for: indexPath) as? HealthHeaderCollectionViewCell else { return UICollectionReusableView() }
            
            switch indexPath.section {
            case 0: cell.headertitle.text = "다시 찾은 건강"
            default: cell.headertitle.text = "절약한 물품"
            }
            return cell
        case UICollectionElementKindSectionFooter:
            guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "HealthFooterCollectionViewCell", for: indexPath) as? HealthFooterCollectionViewCell else { return UICollectionReusableView() }
            switch indexPath.section {
            case 1: cell.informLabel.text = "* 물품 가격은 한국 기준입니다."
            default : cell.informLabel.text = ""
            }
            return cell
        default: return UICollectionReusableView()
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HealthCollectionCell", for: indexPath) as! HealthCollectionViewCell
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.mainimage.image = UIImage(named: "img20M")
                cell.titlelabel.text = "20분 후"
                cell.subtitle.text = "혈압과 맥박이 정상으로 돌아옵니다."
                if let second = getTime() {
                    cell.progressView.setProgress(Float(second/1200), animated: false)
                }
                break
            case 1:
                cell.mainimage.image = UIImage(named: "img12H")
                cell.titlelabel.text = "12시간 후"
                cell.subtitle.text = "혈액 속의 산소량이 정상으로 올라갑니다."
                if let second = getTime() {
                    cell.progressView.setProgress(Float(second/43200), animated: false)
                }
                break
            case 2:
                cell.mainimage.image = UIImage(named: "img2W")
                cell.titlelabel.text = "2주 후"
                cell.subtitle.text = "혈액순환이 좋아지고 폐기능이 좋아집니다."
                if let second = getTime() {
                    cell.progressView.setProgress(Float(second/1209600), animated: false)
                }
                break
            case 3:
                cell.mainimage.image = UIImage(named: "img5W")
                cell.titlelabel.text = "5주 후"
                cell.subtitle.text = "기침이 줄어들고 숨쉬기 편안해집니다."
                if let second = getTime() {
                    cell.progressView.setProgress(Float(second/3024000), animated: false)
                }
                break
            default:
                break
            }
            break
            
        default:
            switch indexPath.row {
            case 0:
                cell.mainimage.image = UIImage(named: "imgDay1")
                cell.titlelabel.text = "햄버거 세트"
                cell.subtitle.text = "6,000원"
                if let price = getprice() {
                    cell.progressView.setProgress(Float(price/6000), animated: false)
                }
                break
            case 1:
                cell.mainimage.image = UIImage(named: "imgDay3")
                cell.titlelabel.text = "영화 1편"
                cell.subtitle.text = "12,000원"
                if let price = getprice() {
                    cell.progressView.setProgress(Float(price/12000), animated: false)
                }
                break
            case 2:
                cell.mainimage.image = UIImage(named: "imgDay7")
                cell.titlelabel.text = "놀이공원 자유이용권"
                cell.subtitle.text = "45,000원"
                if let price = getprice() {
                    cell.progressView.setProgress(Float(price/45000), animated: false)
                }
                break
            default:
                break
            }

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
//        return CGSize(width: UIScreen.main.bounds.width - 32 , height: 90)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Get frame width
        let width = self.view.frame.width
        //I want a width of 418 and height of 274 (Aspect ratio 209:137) with a margin of 24 on each side of the cell (See insetForSectionAt 24 + 24 = 48). So, check if a have that much screen real estate.
        if width > (343 + 32) {
            //If I do return the size I want
            return CGSize(width: 343, height: 90)
        }else{
            //Get new width. Frame width minus the margins I want to maintain
            let newWidth = (width - 32)
            //If not calculate the new height that maintains the aspect ratio I want. NewHeight = (originalHeight / originalWidth) * newWidth
//            let height = (90 / 343) * newWidth
            //Return the new size that is Aspect ratio 209:137
            return CGSize(width: newWidth, height: 90)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 15, left: 16, bottom: 15, right: 16)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 15
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 15
//    }

}
















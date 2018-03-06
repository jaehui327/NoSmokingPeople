//
//  TipViewController.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2017. 8. 9..
//  Copyright © 2017년 김재희. All rights reserved.
//

import UIKit
import KYDrawerController

class TipViewController: UIViewController {

    @IBOutlet weak var TipCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImage(named: "invalidName")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        
        self.TipCollectionView.delegate = self
        self.TipCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    @IBAction func btnMenuPressed(_ sender: Any) {
        if let drawer = tabBarController?.parent as? KYDrawerController {
            drawer.setDrawerState(.opened, animated: true)
        }
    }
}

extension TipViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TipCollectionCell", for: indexPath) as! TipCollectionViewCell
        
        switch indexPath.row {
        case 0:
            cell.titleimage.image = UIImage(named : "imgTipTitle1")
            cell.titlelabel.text = "담배의 역사"
            
            break
//        default:
//            cell.titleimage.image = UIImage(named : "appcenter")
//            cell.titlelabel.text = "앱센터 짱짱맨"
//            break
        default:
            break
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            self.performSegue(withIdentifier: "tipDetail", sender: self)
        }
        
        cell.layer.cornerRadius = 4
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        cell.layer.shadowOpacity = 0.35
        cell.layer.shadowRadius = 4
        
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = UIScreen.main.bounds.width - 55
//        let height = width / 320 * 208
//        return CGSize(width: width, height: height)
//
//        //320 208
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Get frame width
        let width = self.view.frame.width
        //I want a width of 418 and height of 274 (Aspect ratio 209:137) with a margin of 24 on each side of the cell (See insetForSectionAt 24 + 24 = 48). So, check if a have that much screen real estate.
        if width > (320 + 32) {
            //If I do return the size I want
            return CGSize(width: 320, height: 208)
        }else{
            //Get new width. Frame width minus the margins I want to maintain
            let newWidth = (width - 32)
            //If not calculate the new height that maintains the aspect ratio I want. NewHeight = (originalHeight / originalWidth) * newWidth
                        let height = (208 / 343) * newWidth
            //Return the new size that is Aspect ratio 209:137
            return CGSize(width: newWidth, height: height)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        var cell = collectionView.cellForItem(at: indexPath)
//
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, animations: ({
//
//        }), completion: nil)
//
//    }
    
}








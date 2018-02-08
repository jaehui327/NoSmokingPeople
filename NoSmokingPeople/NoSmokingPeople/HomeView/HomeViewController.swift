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

    
    @IBOutlet weak var HomeCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        
        let logo = UIImage(named: "invalidName")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        
        self.HomeCollectionView.dataSource = self
        self.HomeCollectionView.delegate = self
        
        
        /*
        let imgIcon = UIImage(named: "btnMenu")?.withRenderingMode(.alwaysOriginal)
        let leftbarButton = UIBarButtonItem(image: imgIcon, style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftbarButton
        */

        // Do any additional setup after loading the view.
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
            cell.subtitle.text = "00일 00시간 00분 00초"
            break
        case 1:
            cell.imageSign.image = UIImage(named: "imgSign2")
            cell.maintitle.text = "수면연장"
            cell.subtitle.text = "00일 00시간 00분 00초"
            break
        case 2:
            cell.imageSign.image = UIImage(named: "imgSign3")
            cell.maintitle.text = "절약한 담배값"
            cell.subtitle.text = "0000.0원"
            break
        case 3:
            cell.imageSign.image = UIImage(named: "imgSign4")
            cell.maintitle.text = "안피운 담배개비"
            cell.subtitle.text = "0000.0개비"
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 30 , height: 60)
    }
}

extension UITabBar {
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 56
        return sizeThatFits
    }
}











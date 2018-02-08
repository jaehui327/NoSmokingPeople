//
//  SettingViewController.swift
//  NoSmokingPeople
//
//  Created by 김재희 on 2017. 8. 31..
//  Copyright © 2017년 김재희. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var SettingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "invalidName")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView

        self.SettingTableView.delegate = self
        self.SettingTableView.dataSource = self
        
        self.SettingTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnBackPressed(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)

    }
    

}

extension SettingViewController : UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingHeaderTableCell") as! SettingHeaderTableViewCell
        switch section {
        case 0:
            cell.headertitle.text = "앱 정보"
            break
        case 1:
            cell.headertitle.text = "푸쉬알림 설정"
            break
        default:
            cell.headertitle.text = "회원설정"
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableCell") as! SettingTableViewCell
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.maintitle.text = "현재 버전"
                cell.versiontitle.text = "v1.01"
                cell.updatetitle.text = "업데이트"
                cell.updatetitle.isHidden = true
                cell.pushnoticeswitch.isHidden = true
                break
            default:
                cell.maintitle.text = "현재 버전"
                cell.versiontitle.text = "v1.01"
                cell.updatetitle.text = "업데이트"
                cell.pushnoticeswitch.isHidden = true
                break
            }
            break
        case 1:
            switch indexPath.row {
            case 0:
                cell.maintitle.text = "금연일기 정기 알림"
                cell.versiontitle.isHidden = true
                cell.updatetitle.isHidden = true
                break
            default:
                cell.maintitle.text = "금연 Tip 알림"
                cell.versiontitle.isHidden = true
                cell.updatetitle.isHidden = true

                break
            }
            break
        default:
            switch indexPath.row {
            case 0:
                cell.maintitle.text = "로그아웃"
                cell.versiontitle.isHidden = true
                cell.updatetitle.isHidden = true
                cell.pushnoticeswitch.isHidden = true
                break
            default:
                cell.maintitle.text = "회원탈퇴"
                cell.versiontitle.isHidden = true
                cell.updatetitle.isHidden = true
                cell.pushnoticeswitch.isHidden = true

                break
            }
            break
        }
        
        
        return cell
        
        
    }
    
    
    
    
}








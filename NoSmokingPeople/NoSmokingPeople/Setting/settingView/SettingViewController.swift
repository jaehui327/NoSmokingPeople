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
    
    func showSmoking(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "smokingCheck") as? SmokingCheckViewController else { return }
        self.present(vc, animated: true, completion: nil)
    }
    
    func deleteUserDefaults() {
        let appDomain = Bundle.main.bundleIdentifier
        UserDefaults.standard.removePersistentDomain(forName: appDomain!)
    }

}

extension SettingViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingHeaderTableCell") as! SettingHeaderTableViewCell
        switch section {
        case 0:
            cell.headertitle.text = "앱 정보"
            break
        case 1:
            cell.headertitle.text = "재설정"
            break
        default: break
            //        case 1:
            //            cell.headertitle.text = "푸쉬알림 설정"
            //            break
            //        default:
            //            cell.headertitle.text = "회원설정"
            //            break
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
                cell.resetButton.isHidden = true
                cell.pushnoticeswitch.isHidden = true
                break
            default:
                cell.maintitle.text = "최신 버전"
                cell.versiontitle.text = "v1.01"
                cell.resetButton.isHidden = true
                cell.pushnoticeswitch.isHidden = true
                break
            }
            break
        case 1:
            cell.maintitle.text = "초기화 하기"
            cell.versiontitle.isHidden = true
            cell.resetButton.setTitle("초기화", for: .normal)
            cell.pushnoticeswitch.isHidden = true
            cell.onButtonTapped = {
//                self.deleteUserDefaults()
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let smokingVC = storyboard.instantiateViewController(withIdentifier: "smokingCheck")
//                self.present(smokingVC, animated: true, completion: nil)
                
//                if let ResetViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResetViewController") as? ResetViewController {
//                    ResetViewController.modalPresentationStyle = .overCurrentContext
//                    self.present(ResetViewController, animated: false, completion: nil)
//                }
                let alertController = UIAlertController(title: "초기화 하시겠습니까?",message: "그동안의 금연 기록이 사라지고 리셋됩니다.", preferredStyle: UIAlertControllerStyle.alert)
                
                //UIAlertActionStye.destructive 지정 글꼴 색상 변경
                let okAction = UIAlertAction(title: "삭제", style: UIAlertActionStyle.destructive){ (action: UIAlertAction) in
                    print("내용 삭제 실행")
                    self.deleteUserDefaults()
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let smokingVC = storyboard.instantiateViewController(withIdentifier: "smokingCheck")
                    self.present(smokingVC, animated: true, completion: nil)
                }
                
                let cancelButton = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel, handler: nil)
                
                alertController.addAction(okAction)
                alertController.addAction(cancelButton)
                
                self.present(alertController,animated: true,completion: nil)
            }
            break
            default: break
                //        case 1:
                //            switch indexPath.row {
                //            case 0:
                //                cell.maintitle.text = "금연일기 정기 알림"
                //                cell.versiontitle.isHidden = true
                //                cell.updatetitle.isHidden = true
                //                break
                //            default:
                //                cell.maintitle.text = "금연 Tip 알림"
                //                cell.versiontitle.isHidden = true
                //                cell.updatetitle.isHidden = true
                //
                //                break
                //            }
                //            break
                //        default:
                //            switch indexPath.row {
                //            case 0:
                //                cell.maintitle.text = "로그아웃"
                //                cell.versiontitle.isHidden = true
                //                cell.updatetitle.isHidden = true
                //                cell.pushnoticeswitch.isHidden = true
                //                break
                //            default:
                //                cell.maintitle.text = "회원탈퇴"
                //                cell.versiontitle.isHidden = true
                //                cell.updatetitle.isHidden = true
                //                cell.pushnoticeswitch.isHidden = true
                //
                //                break
                //            }
                //            break
            }
            
            cell.selectionStyle = .none
            
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
            return cell
            
            
        }
        
        
    }









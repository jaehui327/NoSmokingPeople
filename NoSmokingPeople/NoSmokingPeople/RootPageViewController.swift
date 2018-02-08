//
//  RootPageViewController.swift
//  seminar_4
//
//  Created by 김재희 on 2017. 4. 29..
//  Copyright © 2017년 addcampus. All rights reserved.
//

import Foundation
import UIKit


// 90BACB

class RootPageViewController : UIPageViewController,UIPageViewControllerDataSource{
    
    
    //뷰 컨트롤러 객체들을 담아 놓는 프로퍼티
    var viewControllerList : [UIViewController] = {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = sb.instantiateViewController(withIdentifier: "First")
        let vc2 = sb.instantiateViewController(withIdentifier: "Second")
        let vc3 = sb.instantiateViewController(withIdentifier: "Third")
        let vc4 = sb.instantiateViewController(withIdentifier: "Fourth")

        
        return [vc1,vc2,vc3,vc4]
    }()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        //금연의 민족 로고 
        let logo = UIImage(named: "invalidName")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        
        //네비게이션 바 숨김 처리 부분
        self.navigationController?.navigationBar.isHidden = false

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //이번 예제에서는 UIPageViewControllerDelegate를 사용할일이 없었습니다
        //이전 뷰 컨트롤러와, 다음 뷰 컨트롤러 객체를 반환하는 함수는 dataSource에 명세되어 있는 메소드입니다.
        self.dataSource = self
        
        
        //페이지뷰컨트롤러의 Root로 viewControllerList의 첫번째 뷰 컨트롤러(FirstVC)를 지정
        if let firstViewController = viewControllerList.first{
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        
        //self.view 는 뷰 컨트롤러의 슈퍼뷰(최상위뷰) 입니다
        for view in self.view.subviews{
            //is 는 타입 연산자로 view 가 UIPageControl의 타입인지 비교하는 조건문
            if view is UIPageControl{
                
                //view(self.view.subview)->  서브뷰들중 하나
                
                //view를 UIPageControl로 캐스팅
                let appearance = view as! UIPageControl
                appearance.backgroundColor = UIColor.white
                //페이지 dot(선택되지 않았을 떄)의 색상
                appearance.pageIndicatorTintColor = UIColor.gray
                //선택된 페이지뷰 컨트롤러의 도트색상
                appearance.currentPageIndicatorTintColor = UIColor.red
            }
            
        }
    }
    
    
    //이전 페이지에 나타날 뷰 컨트롤러 객체를 반환
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        //현재 뷰에 띄워져있는 뷰 컨트롤러의 인덱스값을 옵셔널 바인딩을 이용해서 가져옵니다
        //index(of:viewController) 에 있는 viewController는 이 딜리게이트 메소드의 두번쨰 내부 매개변수로서, 현재 뷰에 보여지고 있는 뷰컨트롤러 객체를 참조합니다
        guard let vcIndex = viewControllerList.index(of: viewController) else {
            return nil
        }
        print("vcIndex")
        print(vcIndex)
        
        //현재 인덱스값 - 1 = 이전 인덱스값
        let previousIndex = vcIndex - 1
        //  print("previousIndex")
        // print(previousIndex)
        // print("Before")
        
        // print("!@#!@#")
        // print(viewControllerList[previousIndex])
        
        guard previousIndex >= 0 else{
            //previousIndex < 0
            //이전 뷰컨트롤러의 인덱스가 0보다 작아질경우(첫번째 뷰가 선택된 상황에서 왼쪽으로 스와이프(더 이전으로 가려고 할경우, 즉 인덱스값이 0보다 작을떄)
            //마지막 뷰 컨트롤러가 나타나게 해줍니다
            
            //return viewControllerList.last
            return nil
        }
        guard viewControllerList.count > previousIndex else{
            //previousIndex >= viewControllerList.count
            return nil
        }
        
        //이전 인덱스값을 가진 뷰컨트롤러 객체 반환
        return viewControllerList[previousIndex]
    }
    
    //다음 페이지에 나타날 뷰 컨트롤러 객체를 반환
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        //현재 뷰에 띄워져있는 뷰 컨트롤러의 인덱스값을 옵셔널 바인딩을 이용해서 가져옵니다
        //index(of:viewController) 에 있는 viewController는 이 딜리게이트 메소드의 두번쨰 내부 매개변수로서, 현재 뷰에 보여지고 있는 뷰컨트롤러 객체를 참조합니다
        guard let vcIndex = viewControllerList.index(of: viewController) else {
            return nil
        }
        print("AfterVCIndex")
        print(vcIndex)
        
        let nextIndex = vcIndex + 1
        
        //print("After")
        //print("vcIndex")
        //print(vcIndex)
        
        
        guard viewControllerList.count != nextIndex else{
            
            //nextIndex == viewControllerList.count
            //마지막 뷰 컨트롤러에서 오른쪽으로 스와이프(다음 뷰 컨트롤러)로 이동하려고 할경우, 첫번쨰 뷰 컨트롤러로 이동시켜줍니다
            //return viewControllerList.first
            return nil
        }
        
        guard viewControllerList.count > nextIndex else{
            //viewControllerList.count <= nextIndex
            return nil
        }
        
        //다음 인덱스값을 가진 뷰 컨트롤러 객체 반환
        return viewControllerList[nextIndex]
    }
    
    
    //아래 두개의 딜리게이트 메소드는 페이지뷰의  'indicator(dot) 를 나타내주기 위해' 반드시 필요한 딜리게이트 메소드들입니다
    
    //indicator(dot) 갯수 반환
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return  viewControllerList.count
    }
    
    // -> 페이지뷰가 로드되었을 때 첫 페이지가 될 인디케이터의 인덱스값을 반환해줍니다
    // return 값을 0,1,2, 로 바꿔가면서 어떤점이 다른지 비교해주세요
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        /* guard let firstViewController = viewControllers?.first,let firstViewControllerIndex = viewControllerList.index(of: firstViewController) else {
         return 0
         }
         print("!@#@!#")
         print(pageViewController)*/
        return 1
    }
    
    
    
    
    
}

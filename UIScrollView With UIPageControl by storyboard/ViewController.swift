//
//  ViewController.swift
//  UIScrollView With UIPageControl by storyboard
//
//  Created by EthanLin on 2017/12/21.
//  Copyright © 2017年 EthanLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    
    let fullScreenSize = UIScreen.main.bounds.size
    
    var sceneArray = ["scene1","scene2","scene3","scene4","scene5","scene6"]

    @IBOutlet weak var myScrollView: UIScrollView!
    
    @IBOutlet weak var myPageControll: UIPageControl!
    
    //透過PageControl下方的點來控制顯示的頁，以PageControl來影響ScrollView
    @IBAction func pageChanged(_ sender: UIPageControl) {
            let currentPageNumber = sender.currentPage
            let width = myScrollView.frame.size.width
            let offset = CGPoint(x: width * CGFloat(currentPageNumber), y: 0)
            myScrollView.setContentOffset(offset, animated: true)
    }
    
    var myScrollImageview: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myScrollView.contentSize.width = (fullScreenSize.width) * CGFloat(sceneArray.count)
        myScrollView.contentSize.height = fullScreenSize.height
        myScrollView.showsVerticalScrollIndicator = false
        myScrollView.showsHorizontalScrollIndicator = false
        myScrollView.delegate = self
        myScrollView.isPagingEnabled = true
        
        myPageControll.numberOfPages = sceneArray.count
        myPageControll.currentPage = 0
        myPageControll.currentPageIndicatorTintColor = .blue
        myPageControll.pageIndicatorTintColor = .brown
        
        for i in 0...5{
            myScrollImageview = UIImageView()
            myScrollImageview.frame = CGRect(x: fullScreenSize.width * CGFloat(i), y: 0, width: fullScreenSize.width, height: fullScreenSize.height)
            myScrollImageview.image = UIImage(named: sceneArray[i])
            self.myScrollView.addSubview(myScrollImageview)
        }
        
    }
    
  
    
    //利用捲到的位置來決定pageControll的currentPage ，以ScrollView來影響PageControll
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(myScrollView.contentOffset.x / myScrollView.frame.size.width)
        myPageControll.currentPage = currentPage
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  HtmlViewController.swift
//  testDeepLink
//
//  Created by Dkbmc Developer on 2017. 8. 21..
//  Copyright © 2017년 Oingbong. All rights reserved.
//

import UIKit

class HtmlViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // PDF or HTML 파일열기 (xlsx는 지원 안함)
        let localfilePath = Bundle.main.url(forResource: "fileTest", withExtension: "html")
        let myRequest = NSURLRequest(url: localfilePath!)
        webView.loadRequest(myRequest as URLRequest)
        
        // 스크린샷 감지 1
        NotificationCenter.default.addObserver(self, selector: #selector(HtmlViewController.userDidTakeCapture(notification:)), name: .UIApplicationUserDidTakeScreenshot, object: nil)
    }
    
    // 스크린샷 감지 2
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // 스크린샷 감지 3
    func userDidTakeCapture(notification: Notification){
        print("캡쳐 감지 !!!")
        let titleM = "스크린샷에 대한 제목"
        let messageM = "법적책임을 물을수도 있다는 내용"
        let buttonM = "죄송합니다"
        
        let dialog = UIAlertController(title: titleM, message: messageM, preferredStyle: .alert)
        
        let action = UIAlertAction(title: buttonM, style: UIAlertActionStyle.default)
        dialog.addAction(action)
        
        self.present(dialog, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}

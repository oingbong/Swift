//
//  Record.swift
//  Memo
//
//  Created by Dkbmc Developer on 2017. 7. 24..
//  Copyright © 2017년 Oingbong. All rights reserved.
//

import UIKit

class Record: UIViewController {
    @IBOutlet weak var RecordTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // as! String! 을 추가하여 문자라는 표현을 추가합니다.
        // as! 무조건 값이 있으며 String, as? 값이 있으면 String 없으면 공란
        RecordTextView.text = UserDefaults.standard.object(forKey: "0") as? String
    }

    @IBAction func Save(_ sender: Any) {
        // 1: 저장할 값 , 2: 해당 저장 이름
        UserDefaults.standard.set(RecordTextView.text, forKey: "0")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

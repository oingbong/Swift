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
    
    var MemoData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        MemoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
        
        if MemoData.count == 0{
            RecordTextView.text = "..."
        }else{
            
            let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
            
            RecordTextView.text = MemoData[MemoNumber]
        }
    }

    @IBAction func Save(_ sender: Any) {
        // 내용 저장
        MemoData.insert(RecordTextView.text, at: 0)
        
        // 어플을 다시 실행해도 저장
        // 1: 저장할 값 , 2: 해당 저장 이름
        UserDefaults.standard.set(MemoData, forKey: "MemoData")
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

//
//  Record.swift
//  Memo
//
//  Created by Dkbmc Developer on 2017. 7. 24..
//  Copyright © 2017년 Oingbong. All rights reserved.
//

import UIKit

class Record: UIViewController {
    
// MARK : - Variable
    @IBOutlet weak var RecordTextView: UITextView!
    var MemoData = [String]()
// Variable_End

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber == -1 {
            MemoData = UserDefaults.standard.object(forKey: "MemoData") as! [String]
            RecordTextView.text = "..."
        } else {
            MemoData = UserDefaults.standard.object(forKey: "MemoData") as! [String]
            RecordTextView.text = MemoData[MemoNumber]
        }
    }

// MARK : - Action
    @IBAction func Save(_ sender: Any) {
        // Button 클릭 -1 로 넘어온 것인지, Cell 클릭 0 혹은 양수로 넘어온 것인지 확인
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber == -1 {
            // 내용 저장
            MemoData.insert(RecordTextView.text, at: 0)
            
            // 어플을 다시 실행해도 저장
            // 1: 저장할 값 , 2: 해당 저장 이름
            UserDefaults.standard.set(MemoData, forKey: "MemoData")
        } else {
            //기준은 MemoNumber 넘어온 위치를 삭제 후 다시 그 위치에 저장하여 update 된 것처럼 작업
            
            // 기존 내용 삭제
            MemoData.remove(at: MemoNumber)
            // 기존 위치에 새로운 내용 저장
            MemoData.insert(RecordTextView.text, at: MemoNumber)
            
            UserDefaults.standard.set(MemoData, forKey: "MemoData")
            
        }
    }
    
    @IBAction func Delete(_ sender: Any) {
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber != -1 {
            MemoData.remove(at: MemoNumber)
            UserDefaults.standard.set(MemoData, forKey: "MemoData")
        }
    }
// Action_End
}

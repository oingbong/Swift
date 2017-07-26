//
//  ViewController.swift
//  Memo
//
//  Created by Dkbmc Developer on 2017. 7. 24..
//  Copyright © 2017년 Oingbong. All rights reserved.
//

import UIKit

class Main: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var MemoData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // 셀 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        MemoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
        
        return MemoData.count
    }
    
    // 꾸며주는 부분
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // withIdentifier 와 Prototype Cells 의 Identifier 와 값이 동일해야 합니다.
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return Cell
    }
    
    // Cell 클릭했을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let MemoNumber = indexPath.row
        UserDefaults.standard.set(MemoNumber, forKey: "MemoNumber")
        
        self.performSegue(withIdentifier: "ToRecord", sender: self)
    }
}


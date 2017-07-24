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
        
        RecordTextView.text = "Hello World"
    }

    @IBAction func Save(_ sender: Any) {
        RecordTextView.text = "Bye World"
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

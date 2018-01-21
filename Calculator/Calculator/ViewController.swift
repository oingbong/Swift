//
//  ViewController.swift
//  Calculator
//
//  Created by Dkbmc Developer on 2018. 1. 4..
//  Copyright © 2018년 oingbong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultDisplay: UILabel!
    
    @IBAction func btnNumber(btnN : UIButton){
        let button = btnN.titleLabel?.text
        resultDisplay.text = resultDisplay.text! + button!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


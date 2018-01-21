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
    
    @IBAction func btn0(_ sender: UIButton) {
        resultDisplay.text = resultDisplay.text! + "0"
    }
    @IBAction func btn1(_ sender: UIButton) {
        resultDisplay.text = resultDisplay.text! + "1"
    }
    @IBAction func btn2(_ sender: UIButton) {
        resultDisplay.text = resultDisplay.text! + "2"
    }
    @IBAction func btn3(_ sender: UIButton) {
        resultDisplay.text = resultDisplay.text! + "3"
    }
    @IBAction func btn4(_ sender: UIButton) {
        resultDisplay.text = resultDisplay.text! + "4"
    }
    @IBAction func btn5(_ sender: UIButton) {
        resultDisplay.text = resultDisplay.text! + "5"
    }
    @IBAction func btn6(_ sender: UIButton) {
        resultDisplay.text = resultDisplay.text! + "6"
    }
    @IBAction func btn7(_ sender: UIButton) {
        resultDisplay.text = resultDisplay.text! + "7"
    }
    @IBAction func btn8(_ sender: UIButton) {
        resultDisplay.text = resultDisplay.text! + "8"
    }
    @IBAction func btn9(_ sender: UIButton) {
        resultDisplay.text = resultDisplay.text! + "9"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


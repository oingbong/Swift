//
//  StreamingViewController.swift
//  Streaming
//
//  Created by Dkbmc Developer on 2017. 10. 29..
//  Copyright © 2017년 oingbong. All rights reserved.
//

import UIKit

class StreamingViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://www.youtube.com/watch?v=3o0cHlpQTJw")
        let request = NSURLRequest(url: url as! URL)
        webView.loadRequest(request as URLRequest)

        // Do any additional setup after loading the view.
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

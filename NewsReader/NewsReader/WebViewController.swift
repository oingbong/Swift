//
//  WebViewController.swift
//  NewsReader
//
//  Created by Dkbmc Developer on 2017. 8. 15..
//  Copyright © 2017년 Oingbong. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var url : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.loadRequest(URLRequest(url: URL(string: url!)!))
    }

    
}

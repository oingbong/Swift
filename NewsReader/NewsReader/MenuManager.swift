//
//  MenuManager.swift
//  NewsReader
//
//  Created by Dkbmc Developer on 2017. 8. 19..
//  Copyright © 2017년 Oingbong. All rights reserved.
//

import UIKit

class MenuManager: NSObject {
    let blackView = UIView()
    
    public func openMenu(){
        if let window = UIApplication.shared.keyWindow {
            blackView.frame = window.frame
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            window.addSubview(blackView)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.blackView.alpha = 1
            })
        }
    }
    
    public func dismissMenu(){
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
        })
    }
    
}

//
//  CustomImageView.swift
//  CircularLoadingView
//
//  Created by Dkbmc Developer on 2017. 8. 23..
//  Copyright © 2017년 oingbong. All rights reserved.
//

import UIKit
import Alamofire

class CustomImageView: UIImageView {

    func setImage(from url: String){
        let utilityQueue = DispatchQueue.global(qos: .utility)
        
        Alamofire.request(url)
            .downloadProgress(queue: utilityQueue){ (progress) in
                // 다운로드 진행되는 % 표시
                print("Downloaded : \(progress.fractionCompleted)")
        }
            .responseData { (response) in
                if let data = response.result.value, let image = UIImage(data: data){
                    // 다운로드 완료 표시
                    print("Image successfully downloaded")
                }
        }
        
    }

}

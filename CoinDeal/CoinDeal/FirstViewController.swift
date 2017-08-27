//
//  FirstViewController.swift
//  CoinDeal
//
//  Created by Dkbmc Developer on 2017. 8. 27..
//  Copyright © 2017년 oingbong. All rights reserved.
//

import UIKit
import Alamofire

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var infoData : Array<String> = Array<String>()
    //var infoData = ["aaaaaaa","bbbbbbb","ccccccc","dddddd"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getApi()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getApi(){
        Alamofire.request("https://api.bithumb.com/public/ticker/all", method: .get, parameters: [:], encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json"])
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                if let jsonData = response.result.value as? [String:Any]{
                    let dictionary = jsonData["data"] as? [String:Any]
                    /*
                     종류 : BTC, ETH, DASH, LTC, ETC, XRP, BCH
                     칼럼
                        average_price
                        buy_price
                        closing_price
                        max_price
                        min_price
                        opening_price
                        sell_price
                        units_traded
                        volume_1day
                        volume_7day
                     */
                    let bch = dictionary?["BCH"] as? [String:Any]
                    let bch_averPrice = bch?["average_price"]
                    print(dictionary as Any)
                    
                    self.infoData.append(bch_averPrice as! String) // 안됨 ( Sync or 다른문제)
                    
                }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoData.count
    }
    
    // 꾸며주는 부분
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // withIdentifier 와 Prototype Cells 의 Identifier 와 값이 동일해야 합니다.
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) // as! MainCell // MainCell Connect
        
        // Memo 내용을 가져와 Title에 표시해주기 위한 작업
        //infoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
        Cell.textLabel?.text = infoData[indexPath.row]
        //Cell.TitleLabel.text = infoData[indexPath.row]
        
        return Cell
    }


}


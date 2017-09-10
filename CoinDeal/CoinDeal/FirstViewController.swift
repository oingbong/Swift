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
    //var NameArr : Array<String> = Array<String>()
    var PriceArr : Array<String> = Array<String>()
    var NameArr = ["BTC","ETH","DASH","LTC","ETC","XRP","BCH","XMR"]
    //var PriceArr = ["aa","bb","cc","dd"]

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
                    /*
                    let bch = dictionary?["BCH"] as? [String:Any]
                    let bch_averPrice = bch?["average_price"]
                    let bch_buy_price = bch?["buy_price"]
                    */
                    
                    //self.infoData.append(bch_averPrice as! String)
                    //self.NameArr.append(bch_buy_price as! String)
                    //self.PriceArr.append(bch_averPrice as! String)
                    /*
                    let currency0 = dictionary?[self.NameArr[0]] as? [String:Any]
                    let currency1 = dictionary?[self.NameArr[1]] as? [String:Any]
                    let currency2 = dictionary?[self.NameArr[2]] as? [String:Any]
                    let currency3 = dictionary?[self.NameArr[3]] as? [String:Any]
                    let currency4 = dictionary?[self.NameArr[4]] as? [String:Any]
                    let currency5 = dictionary?[self.NameArr[5]] as? [String:Any]
                    let currency6 = dictionary?[self.NameArr[6]] as? [String:Any]
                    let currency7 = dictionary?[self.NameArr[7]] as? [String:Any]
                    */
                    print(dictionary as Any)
                    /*
                     하드코딩말고 배열돌면서 하고 싶은데 계속 안됨
                     */
                    for(i, _) in self.NameArr.enumerated() {
                        let price = dictionary?[self.NameArr[i]] as? [String:Any]
                        print("price")
                        print(price as Any)
                        let price_average = price?["average_price"]
                        print("price_average")
                        print(price_average as Any)
                        self.PriceArr.append(price_average as! String)
                    }
                    
                    print(self.PriceArr)
                    
                    self.tableView.reloadData() // JSON 받아온 시점이 tableView 데이터 뿌려준 이후 이므로 reloadData를 한번 실행합니다.
                 
                }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //infoData = UserDefaults.standard.object(forKey: "infoData") as? [String] ?? [String]()
        
        //return infoData.count
        return NameArr.count
    }
    
    // 꾸며주는 부분
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // withIdentifier 와 Prototype Cells 의 Identifier 와 값이 동일해야 합니다.
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainCell // MainCell Connect
        
        // Memo 내용을 가져와 Title에 표시해주기 위한 작업
        //infoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
        //Cell.textLabel?.text = infoData[indexPath.row]
        Cell.NameLabel.text = NameArr[indexPath.row]
        //Cell.PriceLabel.text = PriceArr[indexPath.row]
        
        //Cell.TitleLabel.text = infoData[indexPath.row]
        
        return Cell
    }


}


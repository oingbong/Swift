//
//  FirstViewController.swift
//  Streaming
//
//  Created by Dkbmc Developer on 2017. 10. 15..
//  Copyright © 2017년 oingbong. All rights reserved.
//

import UIKit

var list = ["AAA","BBB","CCC","DDD","EEE"]
var listTitle : Array<String> = []
var listAlbum : Array<String> = []
var listSinger : Array<String> = []
//var listPhoto : Array<String> = []
var listPhoto : Array<Any> = []

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return (list.count)
        return (listTitle.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        //cell.textLabel?.text = list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListCell
        cell.TitleLabel.text = listTitle[indexPath.row]
        cell.AlbumLabel.text = listAlbum[indexPath.row]
        cell.SingerLabel.text = listSinger[indexPath.row]
        cell.PhotoImage.image = UIImage(data: listPhoto[indexPath.row] as! Data)
        
        return (cell)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = ConnectServer(path: "/top100/GN0100/")
        api.request(success: {(data:Any) in
            //print(data)
            //debugPrint(data)
            let jsonData = data as? [String:Any]
            let arrayData = jsonData?["resultData"] as! Array<Any>
            print("-----------------------------------")
            //print("array[0] : \(arrayData[0])")
            //var dicArray : [String:String] = arrayData[0] as! Dictionary
            //print(dicArray)
            //print(dicArray["title"]!)
            
            var listUrl = Array<String>()
            
            for info in arrayData{
                var dic : [String:String] = info as! [String : String]
//                print("dic : \(dic["title"])")
//                print("dic : \(dic["album"])")
                listTitle.append(dic["title"]!)
                listAlbum.append(dic["album"]!)
                listSinger.append(dic["singer"]!)
                listUrl.append(dic["photo"]!)
                
                let url = NSURL(string: dic["photo"]!)
                let photoData = try? Data(contentsOf: url! as URL)
                listPhoto.append(photoData!)
            }

            self.tableView.reloadData()
            
            
        }, fail: { (error: Error?) in
            print(error!)
        })
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


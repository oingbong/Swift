//
//  ViewController.swift
//  NewsReader
//
//  Created by Dkbmc Developer on 2017. 8. 13..
//  Copyright © 2017년 Oingbong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var articles: [Article]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchArticle()
    }
    
    func fetchArticle(){
        let urlRequest = URLRequest(url: URL(string:"https://newsapi.org/v1/articles?source=techcrunch&sortBy=top&apiKey=7eb2a61f124944b78b316ab112134a3c")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest){ (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            self.articles = [Article]()
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                if let articlesFromJson = json["articles"] as? [[String: AnyObject]] {
                    for articleFromJson in articlesFromJson {
                        let article = Article()
                        if let title = articleFromJson["title"] as? String, let author = articleFromJson["author"] as? String, let desc = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let urlToImage = articleFromJson["urlToImage"] as? String {
                            
                            article.author = author
                            article.desc = desc
                            article.headline = title
                            article.url = url
                            article.imageUrl = urlToImage
                        }
                        self.articles?.append(article)
                    }
                }
                
                // 메인 스레드 사용 (이유 ?)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print(error)
            }
            
        }
        
        task.resume()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
        
        cell.title.text = self.articles?[indexPath.item].headline
        cell.desc.text = self.articles?[indexPath.item].desc
        cell.author.text = self.articles?[indexPath.item].author
        cell.imgView.downloadImage(from: (self.articles?[indexPath.item].imageUrl!)!)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0 // articles 가 있는 경우 count , 없는 경우 0 리턴
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! WebViewController
        
        webVC.url = self.articles?[indexPath.item].url // WebViewController.swift 에서 설정한 url 사용하는 것 입니다.
        
        self.present(webVC, animated: true, completion: nil)
    }
    
    let menuManager = MenuManager()
    @IBAction func menuPressed(_ sender: Any) {
        menuManager.openMenu()
    }
    

}


extension UIImageView{
    
    func downloadImage(from url: String){
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        
        task.resume()
        
    }
    
}


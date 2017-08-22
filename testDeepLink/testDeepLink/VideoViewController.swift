//
//  VideoViewController.swift
//  testDeepLink
//
//  Created by Dkbmc Developer on 2017. 8. 21..
//  Copyright © 2017년 Oingbong. All rights reserved.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    let url = NSURL(string: "http://www.ebookfrenzy.com/ios_book/movie/movie.mov")
    
    @IBAction func playVideoCode(sender: Any){
        let player = AVPlayer(url: url! as URL)
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        self.addChildViewController(playerController)
        self.view.addSubview(playerController.view)
        playerController.view.frame = self.view.frame
        player.play()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AVPlayerViewController
        destination.player = AVPlayer(url:url! as URL)
    }
     */
    var path : String = Bundle.main.path(forResource: "movie", ofType: "mov")!
    
    var movieUrl : NSURL = NSURL.fileURL(withPath: path)
    var movie : AVPlayerViewController = AVPlayerViewController()
    movie.view.frame = self.view.bounds
    
    var player : AVPlayer = AVPlayer(url : movieUrl)
    movieplayer = player
    
    self.view.addSubview(movie.view)
    player.play()
}

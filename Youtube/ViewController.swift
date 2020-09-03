//
//  ViewController.swift
//  Youtube
//
//  Created by 졔님 on 2020/09/03.
//  Copyright © 2020 zehye. All rights reserved.
//

import UIKit
import YouTubePlayer
import YoutubePlayer_in_WKWebView

class ViewController: UIViewController {
    
    @IBOutlet weak var player: WKYTPlayerView!
    
    player.load(withVideoId: "MN4zQp2rny8", playerVars: playvarsDic)
    let playvarsDic = ["playsinline": 0, "autoplay": 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.delegate = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController: WKYTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
        playerView.playVideo()
    }
    
}

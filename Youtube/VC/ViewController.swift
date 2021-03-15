//
//  ViewController.swift
//  Youtube
//
//  Created by 졔님 on 2020/09/03.
//  Copyright © 2020 zehye. All rights reserved.
//

import UIKit
import YouTubePlayer

class ViewController: UIViewController {
    

    @IBOutlet weak var playerView: YouTubePlayerView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let playVarDic = ["playsinline": 1]
        let playerURL = URL(string: "https://www.youtube.com/watch?v=MN4zQp2rny8")
        playerView.loadVideoURL(playerURL!)
    }
    
    @IBAction func loadVideo(_ sender: UIButton) {
        let playerVars = [
            "playsinline": 0 ,
            "controls": 0 ,
            "origins":"https://www.youtube.com"
            ] as [String : Any]
        playerView.loadVideoID("MN4zQp2rny8")
    }
    
}

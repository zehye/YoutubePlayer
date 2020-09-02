//
//  ViewController.swift
//  Youtube
//
//  Created by 졔님 on 2020/08/23.
//  Copyright © 2020 zehye. All rights reserved.
//

import UIKit
import YouTubePlayer


class ViewController: UIViewController {
    @IBOutlet weak var playerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let frame = CGRect.init(x: 0, y: 0, width: playerView.frame.width, height: playerView.frame.height)
        let videoPlayer = YouTubePlayerView(frame: frame)
        videoPlayer.backgroundColor = UIColor.black
        self.playerView.insertSubview(videoPlayer, at: 0)
        if let videoURL = URL(string: "https://www.youtube.com/watch?v=MN4zQp2rny8") {
            videoPlayer.loadVideoURL(videoURL)
        }
        
    }
}



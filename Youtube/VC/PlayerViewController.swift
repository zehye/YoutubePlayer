//
//  PlayerViewController.swift
//  Youtube
//
//  Created by 졔님 on 2020/09/03.
//  Copyright © 2020 zehye. All rights reserved.
//

import UIKit
import YouTubePlayer

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var playerView: UIView!
//    var playerView = UIView()
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var titleLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewwillappear")
        let frame = CGRect.init(x: 0, y: 0, width: playerView.frame.width, height: playerView.frame.height)
        let videoPlayer = YouTubePlayerView(frame: frame)
        videoPlayer.backgroundColor = UIColor.black
        self.playerView.insertSubview(videoPlayer, at: 0)
        if let videoURL = URL(string: "https://www.youtube.com/watch?v=MN4zQp2rny8") {
            videoPlayer.loadVideoURL(videoURL)
        }
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func progessSlider() {
        let slider: UISlider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(slider)
        slider.minimumTrackTintColor = UIColor.white
        slider.addTarget(self, action: #selector(self.sliderValueChanged(_:)), for: UIControl.Event.valueChanged)
        
        let safeAreaGuide: UILayoutGuide = self.view.safeAreaLayoutGuide
        let leading: NSLayoutConstraint = slider.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16)
        let trailing: NSLayoutConstraint = slider.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16)
        
        leading.isActive = true
        trailing.isActive = true
        
        self.progressSlider = slider
        
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
    }

}

//
//  YoutubeVC.swift
//  Youtube
//
//  Created by 졔님 on 2021/03/15.
//  Copyright © 2021 zehye. All rights reserved.
//

import UIKit

class YoutubeVC: UIViewController {

    @IBOutlet weak var naviBar: UIView!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var playerLayerView: UIView!
    
    @IBOutlet weak var playerBtns: UIView!
    @IBOutlet weak var centerBtn: UIButton!
    @IBOutlet weak var fullBtn: UIButton!
    
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var playerLayer:AVPlayerLayer!
    var player:AVPlayer!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var playStatus = false
    var isShowBtns = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUI()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
        self.view.layoutIfNeeded()
        self.playerLayer.frame = self.playerLayerView.bounds
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.landscapeRight, .portrait]
    }
    
    func setUI() {
        self.playerLayer = AVPlayerLayer()
        self.playerLayerView.layer.addSublayer(self.playerLayer)
        
        let tapPlayerViewGesture = UITapGestureRecognizer(target: self, action: #selector(tapPlayerView(_:)))
        self.playerView.addGestureRecognizer(tapPlayerViewGesture)
        
        self.naviBar.backgroundColor = UIColor(hex: "ffffff", alpha: 0.2)
        
        self.centerBtn.layer.cornerRadius = self.backBtn.frame.width/2
        self.centerBtn.backgroundColor = UIColor(hex: "ffffff", alpha: 0.5)
        
        self.fullBtn.layer.cornerRadius = self.backBtn.frame.width/2
        self.fullBtn.backgroundColor = UIColor(hex: "ffffff", alpha: 0.5)
        
        self.tableView.register(YoutubeTitleTableCell.self, forCellReuseIdentifier: "TitleCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setNaviBar()
        setCenterBtn()
        setPlayerBtns()
    }
    
    func setNaviBar() {
        let orientation:UIInterfaceOrientation = UIInterfaceOrientation(rawValue: UIDevice.current.value(forKey: "orientation") as! Int)!
        if orientation == .landscapeRight {
            self.backBtn.isHidden = true
            self.titleLbl.isHidden = false
        }else {
            self.backBtn.isHidden = false
            self.titleLbl.isHidden = true
        }
        if playStatus == true {
            UIView.animate(withDuration: 0.5) {
                self.naviBar.alpha = 0.0
            }
        }else {
            UIView.animate(withDuration: 0.5) {
                self.naviBar.alpha = 1.0
            }
        }
    }
    
    func setPlayerBtns() {
        if isShowBtns {
            self.playerBtns.isHidden = false
        }else {
            self.playerBtns.isHidden = true
        }
        if self.isShowBtns == true {
            DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(5)) {
                self.isShowBtns = false
                DispatchQueue.main.async {
                    self.playerBtns.isHidden = true
                }
            }
        }
    }
    
    func setData(videoId:String) {
        XCDYouTubeClient.default().getVideoWithIdentifier(videoId) { (video, error) in
            if let video = video {
                if let streamURL = video.streamURL {
                    self.player = AVPlayer.init(url: streamURL)
                    self.playerLayer.player = self.player
                    self.titleLbl.text = video.title
                    self.isShowBtns = true
                    self.setPlayerBtns()
                }
            }else {
                
            }
        }
    }
    
    @IBAction func centerBtnClicked(_ sender: UIButton) {
        if playStatus {
            self.player.pause()
            self.playStatus = false
        }else {
            self.player.play()
            self.playStatus = true
        }
        setCenterBtn()
        setNaviBar()
    }
    func setCenterBtn() {
        if playStatus == true {
            self.centerBtn.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }else {
            self.centerBtn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
    
    
    @IBAction override func backBtnClicked(_ sender: Any) {
        self.player.pause()
        self.playerLayer.removeFromSuperlayer()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func fullBtnClicked(_ sender: Any) {
        let orientation:UIInterfaceOrientation = UIInterfaceOrientation(rawValue: UIDevice.current.value(forKey: "orientation") as! Int)!
        if orientation == .landscapeRight {
            
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        }else {
            let value = UIInterfaceOrientation.landscapeRight.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        }
        setNaviBar()
    }
    
    @objc func tapPlayerView(_ sender:UITapGestureRecognizer) {
        self.isShowBtns = true
        self.setPlayerBtns()
        
    }
}

extension YoutubeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YoutubeTitleTableCell = tableView.dequeueReusableCell(withIdentifier: "TitleCell") as! YoutubeTitleTableCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//
//  YoutubeTableViewCell.swift
//  Youtube
//
//  Created by 졔님 on 2020/10/27.
//  Copyright © 2020 zehye. All rights reserved.
//

import UIKit

class YoutubeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var channelNameLbl: UILabel!
    @IBOutlet weak var youtubeBtn: UIButton!
    
    class func loadFromNib(nibName: String) -> Self {
        let view = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: self, options: nil).first as! Self
        return view
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

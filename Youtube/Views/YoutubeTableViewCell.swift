//
//  YoutubeTableViewCell.swift
//  Youtube
//
//  Created by 졔님 on 2021/03/15.
//  Copyright © 2021 zehye. All rights reserved.
//

import UIKit

protocol YoutubeTableCellDelegate:class {
    func cellClicked(indexPath:IndexPath)
}

class YoutubeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    var indexPath = IndexPath(row: 0, section: 0)
    
    weak var delegate:YoutubeTableCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initUI()
    }
    
    class func loadFromNib(nibName: String) -> Self {
        let view = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: self, options: nil).first as! Self
        
        return view
    }
    
    func initUI() {
        self.imgView.layer.cornerRadius = 10
        self.imgView.layer.borderColor = UIColor.lightGray.cgColor
        self.imgView.layer.borderWidth = 1.0
        
        self.titleLbl.textColor = UIColor.black
        self.titleLbl.font = UIFont.GmarketSans(type: .Medium, size: 12)
        self.titleLbl.textColor = .black
        self.descLbl.font = UIFont.GmarketSans(type: .Medium, size: 12)
        self.descLbl.textColor = .lightGray
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(cellClicked))
        self.addGestureRecognizer(gesture)
    }
    
    @objc func cellClicked() {
        self.delegate?.cellClicked(indexPath: indexPath)
    }
    
}

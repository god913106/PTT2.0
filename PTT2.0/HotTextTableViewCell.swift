//
//  HotTextTableViewCell.swift
//  PTT2.0
//
//  Created by 洋蔥胖 on 2018/6/29.
//  Copyright © 2018年 ChrisYoung. All rights reserved.
//

import UIKit

class HotTextTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

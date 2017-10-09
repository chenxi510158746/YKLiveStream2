//
//  LiveTableViewCell.swift
//  YKLiveStream2
//
//  Created by chenxi on 2017/9/29.
//  Copyright © 2017年 chenxi. All rights reserved.
//

import UIKit

class LiveTableViewCell: UITableViewCell {

    @IBOutlet weak var imgPor: UIImageView!
    
    @IBOutlet weak var lableNick: UILabel!
    
    @IBOutlet weak var labelAddr: UILabel!
    
    @IBOutlet weak var labelViewers: UILabel!
    
    @IBOutlet weak var imgBigPor: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

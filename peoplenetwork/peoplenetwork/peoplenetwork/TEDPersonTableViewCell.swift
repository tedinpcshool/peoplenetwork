//
//  TEDPersonTableViewCell.swift
//  peoplenetwork
//
//  Created by ios on 2017/6/21.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class TEDPersonTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var lastName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

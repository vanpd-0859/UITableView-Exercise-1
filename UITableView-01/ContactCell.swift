//
//  ContactCell.swift
//  UITableView-01
//
//  Created by Phan Dinh Van on 3/12/19.
//  Copyright © 2019 Phan Dinh Van. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblName.text = "My name"
        imgAvatar.image = UIImage(named: "default")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        imgAvatar.layer.cornerRadius = imgAvatar.frame.size.width/2
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.borderWidth = 1
    }
}

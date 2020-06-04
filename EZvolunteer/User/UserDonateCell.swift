//
//  UserDonateCell.swift
//  EZvolunteer
//
//  Created by Parham Armani on 6/3/20.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit

class UserDonateCell: UITableViewCell {

    @IBOutlet weak var causeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var orgNameLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func Donate(_ sender: Any) {
    }
    
}

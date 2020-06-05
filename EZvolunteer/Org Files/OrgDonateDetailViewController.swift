//
//  OrgDonateDetailViewController.swift
//  EZvolunteer
//
//  Created by apple on 01/06/2020.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit
import Parse

class OrgDonateDetailViewController: UIViewController {

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var orgLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var causeLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var orgDescLabel: UILabel!
    
    var event: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountLabel.layer.borderColor = UIColor.systemTeal.cgColor
        amountLabel.layer.borderWidth = 1.0
        amountLabel.layer.cornerRadius = 8
        
        // Do any additional setup after loading the view.
        eventLabel.text = event["name"] as? String
        let organization = event["organization"] as! PFUser
        emailLabel.text = organization.username
        orgLabel.text = organization["name"] as? String
        phoneNumLabel.text = organization["phoneNumber"] as? String
        orgDescLabel.text = organization["description"] as? String
        
        location.text = event["location"] as? String
        causeLabel.text = event["cause"] as? String
        descLabel.text = event["description"] as? String
        
        let amount = (event["totalDonations"] as? String) ?? "0.00"
        amountLabel.text = "$" + amount
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

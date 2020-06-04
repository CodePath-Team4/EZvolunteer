//
//  UserVolunteerDetail.swift
//  EZvolunteer
//
//  Created by Parham Armani on 6/3/20.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit
import Parse
class UserVolunteerDetail: UIViewController {
    var event : PFObject!
    var users = [PFObject]()
    @IBOutlet weak var orgDescLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var organizationNameLabel: UILabel!
    @IBOutlet weak var eventDescLabel: UILabel!
    @IBOutlet weak var causeLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var eventName: UILabel!
    @IBAction func Withdraw(_ sender: Any) {
    }
    @IBAction func Apply(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            eventName.text = event["name"] as? String ?? "Undefined"
            eventDescLabel.text! = event["description"] as! String
            causeLabel.text! = event["cause"] as! String
            roleLabel.text! = event["role"] as? String ?? "Undefined"
            dateTimeLabel.text! = event["datetime"] as? String ?? "TBA"
            let org = event["organization"] as! PFUser
            let tempString = org.objectId as! String
            let query = PFQuery(className: "_User")
                    query.whereKey("objectId", equalTo:tempString )
                    query.findObjectsInBackground{ (users, error) in
                        if users?.count != 0 {
                            self.users = users!
                            self.orgDescLabel.text = (users?[0]["description"] as! String)
                            self.locationLabel.text = (users?[0]["location"] as? String ?? "Undefined")
                            self.emailLabel.text = (users?[0]["username"] as? String ?? "Undefined")
                            self.phoneLabel.text = (users?[0]["phoneNumber"] as? String ?? "Undefined")
                            self.organizationNameLabel.text = (users?[0]["name"] as? String ?? "Undefined")
                            
                        }
                        else{
                            print("Errrrroooor")
                        }


                    }
            
            

        }
        


}

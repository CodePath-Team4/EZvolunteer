//
//  UserDonateDetail.swift
//  EZvolunteer
//
//  Created by Parham Armani on 6/3/20.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit
import Parse
class UserDonateDetail: UIViewController {
    var event : PFObject!
    var users = [PFObject]()

    @IBOutlet weak var descOrgLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var causeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var organizationNameLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    
    @IBAction func Donate(_ sender: Any) {
      
        
    }
    
    
    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        eventNameLabel.text = event["name"] as? String ?? "Undefined"
        descriptionLabel.text! = event["description"] as! String
        causeLabel.text! = event["cause"] as! String
        let org = event["organization"] as! PFUser
        let tempString = org.objectId as! String
        print(tempString)
        var tempOb :PFObject!
////        emailLabel.text =  org["username"] as? String
//print(org)
//        organizationNameLabel.text = org["name"] as? String
//        print("Got Here 00002\n")
//
//        locationLabel.text = org["location"] as? String
//        descriptionLabel.text = event["description"] as? String
//        descOrgLabel.text = org["description"] as? String
        
        
        let query = PFQuery(className: "_User")
                query.whereKey("objectId", equalTo:tempString )
                query.findObjectsInBackground{ (users, error) in
                    if users?.count != 0 {
                        self.users = users!
                        self.descOrgLabel.text = (users?[0]["description"] as! String)
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

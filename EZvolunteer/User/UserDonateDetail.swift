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
    var tempOrganization = [PFObject]()
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
        print("Got Here 00\n")

        descOrgLabel.text! = event["description"] as! String
        causeLabel.text! = event["cause"] as! String
        let temp = event["organization"] as! PFUser
        var tempOrg : PFObject
        let myObjectID = temp.objectId as! String
//        let query = PFQuery(className: "User")
//        query.whereKey("objectId", equalTo: myObjectID)
//        query.findObjectsInBackground{ (tempOrganization, error) in
//            if tempOrganization != nil {
//                self.tempOrganization = tempOrganization!
//                print(tempOrganization)
//            }
//            print(tempOrganization)
//
//
//        }
    }
    

}

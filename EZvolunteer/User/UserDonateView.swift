//
//  UserDonateView.swift
//  EZvolunteer
//
//  Created by Parham Armani on 6/3/20.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit
import Parse
class UserDonateView:  UIViewController, UITableViewDataSource, UITableViewDelegate {
    var donatingEvents = [PFObject]()
    @IBOutlet weak var donateTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        donateTableView.delegate = self
        donateTableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Events")
        query.whereKey("type", equalTo: "Donation")
        query.findObjectsInBackground{ (donatingEvents, error) in
            if donatingEvents != nil {
                self.donatingEvents = donatingEvents!
                self.donateTableView.reloadData()
//                print(donatingEvents)
            }
            
            
        }
        


        }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return donatingEvents.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDonateCell") as! UserDonateCell
        let event = donatingEvents[indexPath.row]
        cell.eventNameLabel.text! = event["name"] as! String
        cell.locationLabel.text! = event["location"] as! String
//        let org = event["organizaton"] as! String
//        var OrganizationObejct= [PFObject]()
//        let query = PFQuery(className: "User")
//                query.whereKey("objectId", equalTo: org)
//                query.findObjectsInBackground{ (OrganizationObejct, error) in
//                    if OrganizationObejct != nil {
////                        OrganizationObejct = OrganizationObejct!
//                        print(OrganizationObejct)
//                    }
//
//
//                }
//        var organizationObject: PFUser
//        let tempID  = event["organization"] as! String
//        let query = PFQuery(className:"User")
//        query.getObjectInBackground(withId:tempID ) { (organizationObject, error) in
//            if error == nil {
////               organizationObject = success!
//                print(organizationObject)
//            } else {
//                print("Failed")
//            }
//        }
//        cell.orgNameLabel.text! = organizationObject["name"] as! String
        cell.descriptionLabel1.text! = event["description"] as! String

        cell.causeLabel.text! = event["cause"] as! String
        return cell
    }
    
}

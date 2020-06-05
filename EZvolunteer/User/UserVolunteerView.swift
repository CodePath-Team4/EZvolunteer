//
//  UserVolunteerView.swift
//  EZvolunteer
//
//  Created by Parham Armani on 6/3/20.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit
import Parse
class UserVolunteerView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var volunteerTableView: UITableView!
    var volunteeringEvents = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        volunteerTableView.delegate = self
        volunteerTableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Events")
        query.whereKey("type", equalTo: "Volunteering")
        query.findObjectsInBackground{ (volunteeringEvents, error) in
            if volunteeringEvents != nil {
                self.volunteeringEvents = volunteeringEvents!
                self.volunteerTableView.reloadData()
//                print(volunteeringEvents)
            }
            
            
        }
        


    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return volunteeringEvents.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserVolunteerCell") as! UserVolunteerCell
        let event = volunteeringEvents[indexPath.row]
        cell.eventNameLabel.text! = event["name"] as! String
        cell.dateTimeLabel.text! = event["datetime"] as! String
        cell.locationLabel.text! = event["location"] as! String
        cell.descriptionLabel.text! = event["description"] as! String
        cell.causeLabel.text! = event["cause"] as! String
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = volunteerTableView.indexPath(for:cell)!
        let event = volunteeringEvents[indexPath.row]
        let myDestination = segue.destination as!UserVolunteerDetail
        myDestination.event = event
        volunteerTableView.deselectRow(at: indexPath, animated: true)
    }


}

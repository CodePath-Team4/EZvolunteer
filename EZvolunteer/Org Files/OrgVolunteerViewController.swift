//
//  OrgVolunteerViewController.swift
//  EZvolunteer
//
//  Created by apple on 01/06/2020.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit
import Parse

class OrgVolunteerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var volTableView: UITableView!
    
    var volEvents = [PFObject]()
    var events = [PFObject]()
//    var volunteers = [PFUser]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        volTableView.delegate = self
        volTableView.dataSource = self
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Events")
        query.includeKey("organization")
        query.limit = 20
        
        query.findObjectsInBackground { (events, error) in
            if events != nil {
                self.events = events!
                self.volEvents.removeAll()
                var i = 0
                while i != self.events.count{
                    let event = self.events[i]
                    print(event["organization"])
                    let organization = event["organization"] as! PFUser
                    if organization.username == PFUser.current()?.username && (event["type"] as! String) == "Volunteering"{
                        self.volEvents.append(event)
                    }
                    i += 1
                }
                self.volTableView.reloadData()
            }
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return volEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrgVolunteerTableViewCell") as! OrgVolunteerTableViewCell
        
        let event = volEvents[indexPath.row]
        cell.eventNameLabel.text = event["name"] as? String
        cell.dateLabel.text = event["datetime"] as? String
        cell.locationLabel.text = event["location"] as? String
        cell.CauseLabel.text = event["cause"] as? String
        let volunteers = event["volunteers"] as! [PFUser]
        cell.amountLabel.text = "\(volunteers.count)"
        
//        volTableView.deselectRow(at: indexPath, animated: true)
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "volDetailSegue" else {return}
        let cell = sender as! UITableViewCell
        let indexPath = volTableView.indexPath(for: cell)!
        let event = volEvents[indexPath.row]
    
        let detailsViewController = segue.destination as! OrgVolunteerDetailViewController
        detailsViewController.event = event
        let volunteers = event["volunteers"] as! [PFUser]
        detailsViewController.volunteers = volunteers
        
    }

}

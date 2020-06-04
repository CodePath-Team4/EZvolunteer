//
//  OrgDonateViewController.swift
//  EZvolunteer
//
//  Created by apple on 01/06/2020.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit
import Parse

class OrgDonateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var donateTableView: UITableView!
    
    var donationEvents = [PFObject]()
    var events =  [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        donateTableView.delegate = self
        donateTableView.dataSource = self
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
                self.donationEvents.removeAll()
                var i = 0
                while i != self.events.count{
                    let event = self.events[i]
                    let organization = event["organization"] as! PFUser
                    if organization.username == PFUser.current()?.username && (event["type"] as! String) == "Donation"{
                        self.donationEvents.append(event)
                    }
                    i += 1
                }
                self.donateTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return donationEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrgDonateTableViewCell") as! OrgDonateTableViewCell
        let event = donationEvents[indexPath.row]
        
        cell.eventNameLabel.text = event["name"] as? String
        let organization = event["organization"] as! PFUser
        cell.orgNameLabel.text = organization["name"] as? String
        cell.locationLabel.text = event["location"] as? String
        cell.causeLabel.text = event["cause"] as? String
        let amount = (event["totalDonations"] as? String) ?? "0.00"
        cell.amountLabel.text = "$" + amount
        
        donateTableView.deselectRow(at: indexPath, animated: true)
        
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
        guard segue.identifier == "donateDetailSegue" else {return}
        let cell = sender as! UITableViewCell
        let indexPath = donateTableView.indexPath(for: cell)!
        let event = donationEvents[indexPath.row]
       
        let detailsViewController = segue.destination as! OrgDonateDetailViewController
        detailsViewController.event = event
    }
}

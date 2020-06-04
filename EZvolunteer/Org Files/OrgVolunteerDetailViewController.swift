//
//  OrgVolunteerDetailViewController.swift
//  EZvolunteer
//
//  Created by apple on 01/06/2020.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit
import Parse

class OrgVolunteerDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var volDetailTableView: UITableView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    
    var event: PFObject!
    var volunteers = [PFUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        volDetailTableView.delegate = self
        volDetailTableView.dataSource = self
        // Do any additional setup after loading the view.
        amountLabel.layer.borderColor = UIColor.systemTeal.cgColor
        amountLabel.layer.borderWidth = 1.0
        amountLabel.layer.cornerRadius = 8
        
        eventLabel.text = event["name"] as? String
        amountLabel.text = "\(volunteers.count)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return volunteers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrgVolunteerDetailCell") as! OrgVolunteerDetailCell
        
        let volunteer = volunteers[indexPath.row]
        
        cell.volunteerLabel.text = volunteer["name"] as? String
        cell.emailLabel.text = volunteer.username
        cell.phoneNumLabel.text = volunteer["phoneNumber"] as? String
        
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

}

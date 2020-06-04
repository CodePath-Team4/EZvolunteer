//
//  UserVolunteerView.swift
//  EZvolunteer
//
//  Created by Parham Armani on 6/3/20.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit

class UserVolunteerView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var volunteerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        volunteerTableView.delegate = self
        volunteerTableView.dataSource = self
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserVolunteerCell") as! UserVolunteerCell
        
        return cell
    }



}

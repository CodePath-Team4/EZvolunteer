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

    @IBOutlet weak var donateTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        donateTableView.delegate = self
        donateTableView.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDonateCell") as! UserDonateCell
        
        return cell
    }
    
}

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        donateTableView.delegate = self
        donateTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrgDonateTableViewCell") as! OrgDonateTableViewCell
        
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

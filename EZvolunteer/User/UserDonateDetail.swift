//
//  UserDonateDetail.swift
//  EZvolunteer
//
//  Created by Parham Armani on 6/3/20.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit

class UserDonateDetail: UIViewController {

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
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
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

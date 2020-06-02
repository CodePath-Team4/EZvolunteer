//
//  AddEventViewController.swift
//  EZvolunteer
//
//  Created by Kinjal Reetoo on 6/2/20.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit
import Parse

class AddEventViewController: UIViewController {

    @IBOutlet weak var eventNameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var typeSegControl: UISegmentedControl!
    @IBOutlet weak var timeDatePicker: UIDatePicker!
    @IBOutlet weak var durationField: UITextField!
    @IBOutlet weak var causeSegControl: UISegmentedControl!
    @IBOutlet weak var descriptionField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // timeDatePicker.timeZone = TimeZone(secondsFromGMT: 5*60*60)
     //   timeDatePicker.locale = Locale(identifier: "en_US_POSIX")
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSubmit(_ sender: Any) {
        
        let event = PFObject(className: "Events")
        
        event["organization"] = PFUser.current()!
        event["name"] = eventNameField.text
        event["location"] = locationField.text
        let type = typeSegControl.titleForSegment(at: typeSegControl.selectedSegmentIndex)
        event["type"] = type
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mma"
        let now = df.string(from: timeDatePicker.date)
        print(now)
        event["datetime"] = now
        event["duration"] = durationField.text
        let cause = causeSegControl.titleForSegment(at: causeSegControl.selectedSegmentIndex)
        event["cause"] = cause
        event["totalDonations"] = 0
        event["volunteers"] = []
        event["description"] = descriptionField.text
        
        event.saveInBackground { (success, error) in
            if success{
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else {
                print("error!")
            }
        }

        
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

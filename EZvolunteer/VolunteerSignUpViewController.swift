//
//  VolunteerSignUpViewController.swift
//  EZvolunteer
//
//  Created by Kinjal Reetoo on 6/1/20.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit
import Parse

class VolunteerSignUpViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var causeSegControl: UISegmentedControl!
    @IBOutlet weak var locationZipCode: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpVolunteer(_ sender: Any) {
        
        let user = PFUser()
       //identify each user w unique email
        user.username = emailField.text
        user.password = passwordField.text
        user.email = emailField.text
        
        // other fields can be set just like with PFObject
        user["name"] = nameField.text
        user["type"] = "volunteer"
        user["city"] = locationField.text
        user["zipcode"] = locationZipCode.text
        user["phoneNumber"] = phoneNumberField.text
        print(radiusSlider.value)
        user["radius"] = radiusSlider.value
        let cause = causeSegControl.titleForSegment(at: causeSegControl.selectedSegmentIndex)
        user["cause"] = [cause]
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "volunteerSignUpSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
                
                let alertController = UIAlertController(title: "Invalid Information", message:
                    error?.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Got it!", style: .default))

                self.present(alertController, animated: true, completion: nil)
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

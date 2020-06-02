//
//  OrganizationSignUpViewController.swift
//  EZvolunteer
//
//  Created by Kinjal Reetoo on 6/1/20.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit
import Parse


class OrganizationSignUpViewController: UIViewController {

    
    @IBOutlet weak var organizationNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var causeSegControl: UISegmentedControl!
    @IBOutlet weak var descriptionField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        //identify each user w unique email
         user.username = emailField.text
         user.password = passwordField.text
         user.email = emailField.text
         
         // other fields can be set just like with PFObject
         user["name"] = organizationNameField.text
         user["type"] = "organization"
         user["city"] = cityField.text
         user["zipcode"] = zipCodeField.text
         user["phoneNumber"] = phoneNumberField.text
         let cause = causeSegControl.titleForSegment(at: causeSegControl.selectedSegmentIndex)
         user["cause"] = [cause]
        user["description"] = descriptionField.text

         
         user.signUpInBackground { (success, error) in
             if success {
                 self.performSegue(withIdentifier: "orgSignUpSegue", sender: nil)
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

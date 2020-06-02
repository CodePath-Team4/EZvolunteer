//
//  LoginViewController.swift
//  EZvolunteer
//
//  Created by Kinjal Reetoo on 6/1/20.
//  Copyright © 2020 EZvolunteer. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSignIn(_ sender: Any) {
        let username = emailField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password)
        { (user, error) in
            if user != nil {
                
                let type = user?["type"] as! String
                print(type)
                if type == "volunteer"{
                    self.performSegue(withIdentifier: "loginVolunteerSegue", sender: nil)
                } else{
                    self.performSegue(withIdentifier: "loginOrgSegue", sender: nil)

                }
                
                
            } else{
                print("Error:\(error?.localizedDescription)")
                
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

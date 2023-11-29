//
//  LoginTableViewController.swift
//  SMU
//
//  Created by Swati Bhandare on 10/15/23.
//

import UIKit
import Firebase

class LoginTableViewController: UITableViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

             let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
        }

        //Calls this function when the tap is recognized.
        @objc func dismissKeyboard() {
            view.endEditing(true)
    }

   
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        
        guard let email = emailTxt.text else { return }
        guard let password = passwordTxt.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("error")
            }
            else{
                // Go to homepage
                self.performSegue(withIdentifier: "goToHome", sender: self)
            }
        }
        
    }
    
}

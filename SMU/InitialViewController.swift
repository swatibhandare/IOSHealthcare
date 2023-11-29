//
//  InitialViewController.swift
//  SMU
//
//  Created by Swati Bhandare on 10/28/23.
//

import UIKit
import Firebase

class InitialViewController: UIViewController {
   
    @IBOutlet weak var usrnameTxt: UITextField!
    
    @IBOutlet weak var pswdTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
       view.addGestureRecognizer(tap)
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    

    @objc func dismissKeyboard() {
        view.endEditing(true)
}
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        
        guard let email = usrnameTxt.text else { return }
        guard let password = pswdTxt.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                self.showAlert("Wrong username or password! Please try again!")
            }
            else{
                // Go to homepage
                self.performSegue(withIdentifier: "goToHome", sender: self)
            }
        }
    }
    
    func showAlert(_ msg: String) {
        let alert = UIAlertController(title: "Alert", message: msg , preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
    }
    
    

}

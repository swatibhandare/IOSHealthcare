//
//  AddMemberTableViewController.swift
//  SMU
//
//  Created by Swati Bhandare on 10/20/23.
//

import UIKit

class AddMemberTableViewController: UITableViewController {

    @IBOutlet weak var fnameTxt: UITextField!
    
    @IBOutlet weak var lnameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var phoneTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
   
    @IBAction func addFamilyMemberClicked(_ sender: UIButton) {
        let modelInfo = FamilyMemberModel(fname: fnameTxt.text!, lname: lnameTxt.text!, phone: phoneTxt.text!, email: emailTxt.text!, doctorId: "")
        let isSave = DatabaseManager.getInstance().saveData(modelInfo)
        print(isSave)
        if(isSave==true){ 
            showAlert("Record added")
            fnameTxt.text! = ""
            lnameTxt.text! = ""
            phoneTxt.text! = ""
            emailTxt.text! = ""
        }else{
            showAlert("Please try again!")
        }
        print("Added")
    }
    
    func showAlert(_ msg: String) {
        let alert = UIAlertController(title: "Alert", message: msg , preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
    }
    
}

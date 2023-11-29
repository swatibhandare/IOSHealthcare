//
//  DoctorHomepageViewController.swift
//  SMU
//
//  Created by Swati Bhandare on 11/13/23.
//

import UIKit
import SwiftUI

class DoctorHomepageViewController: UIViewController {

    @IBOutlet weak var doctorName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = UIHostingController(rootView: SwiftUIView())
        let swiftuiView = vc.view!
        
        swiftuiView.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(vc)
        view.addSubview(swiftuiView)
        
        NSLayoutConstraint.activate([
            swiftuiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swiftuiView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        vc.didMove(toParent: self)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateDoctorsInfoClicked(_ sender: Any) {
        let isSave = DatabaseManager.getInstance().saveDoctorsInfo(doctorName.text!)
        print(isSave)
        if(isSave==true){
            showAlert("Record updated")
            doctorName.text! = ""
        }else{
            showAlert("Please try again!")
        }
        print("Updated")
    }
    
    func showAlert(_ msg: String) {
        let alert = UIAlertController(title: "Alert", message: msg , preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
    }

}

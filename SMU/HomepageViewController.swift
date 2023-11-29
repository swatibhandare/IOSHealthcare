//
//  HomepageTableViewController.swift
//  SMU
//
//  Created by Swati Bhandare on 10/15/23.
//

import UIKit

class HomepageViewController: UIViewController {

    @IBOutlet weak var navBar: UINavigationItem!
    
    
    @IBOutlet weak var familyUIImageView: UIImageView!
    
    @IBOutlet weak var doctorsUIImageView: UIImageView!
    
    @IBOutlet weak var nurseUIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
     
        let famTapGestureRecog = UITapGestureRecognizer(target: self, action: #selector(showFamilyImageview(tapGestureRecognizer:)))
        familyUIImageView.isUserInteractionEnabled = true
        familyUIImageView.addGestureRecognizer(famTapGestureRecog)
        
    }
    
  

    @objc func showFamilyImageview(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        self.performSegue(withIdentifier: "showFamilyHomepage", sender: self)
    }

    @IBAction func signoutClicked(_ sender: UIButton) {
    }
    
    
}

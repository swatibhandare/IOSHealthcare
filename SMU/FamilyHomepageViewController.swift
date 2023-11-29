//
//  FamilyViewController.swift
//  SMU
//
//  Created by Swati Bhandare on 10/27/23.
//

import UIKit

class FamilyHomepageViewController: UIViewController {

    @IBOutlet weak var addFamilyUIImageView: UIImageView!
    
    @IBOutlet weak var showFamilyUIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Family"
        // Do any additional setup after loading the view.
        
        let addFamTapGestureRecog = UITapGestureRecognizer(target: self, action: #selector(addFamilyImageview(tapGestureRecognizer:)))
        addFamilyUIImageView.isUserInteractionEnabled = true
        addFamilyUIImageView.addGestureRecognizer(addFamTapGestureRecog)
        
        let showFamTapGestureRecog = UITapGestureRecognizer(target: self, action: #selector(showFamilyImageview(tapGestureRecognizer:)))
        showFamilyUIImageView.isUserInteractionEnabled = true
        showFamilyUIImageView.addGestureRecognizer(showFamTapGestureRecog)
    }
    
    @objc func addFamilyImageview(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        self.performSegue(withIdentifier: "addFamilyMember", sender: self)
    }

    @objc func showFamilyImageview(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        self.performSegue(withIdentifier: "showFamilyMember", sender: self)
    }

   

}

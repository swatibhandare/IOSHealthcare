//
//  FamilyMemberViewController.swift
//  SMU
//
//  Created by Swati Bhandare on 10/22/23.
//

import UIKit

class FamilyMemberViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tblTableview: UITableView!
    var getAllDataInfo = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblTableview.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getAllDataInfo = DatabaseManager.getInstance().getAllFamilyMembers()
        tblTableview.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(getAllDataInfo.count)
        return getAllDataInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FamilyMemberTableViewCell") as! FamilyMemberTableViewCell
        var l = getAllDataInfo.object(at:  indexPath.row) as! FamilyMemberModel
        
        cell.fnameLbl.text! = l.fname
        cell.lnameLbl.text! = l.lname
        
        return cell
    }

}

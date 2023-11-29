//
//  eventInfoViewController.swift
//  SMU
//
//  Created by Swati Bhandare on 11/23/23.
//

import UIKit

class eventInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var getAllDataInfo = NSMutableArray()
    
    @IBOutlet weak var allEventsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllDataInfo = DatabaseManager.getInstance().getAllEvents()
        allEventsTableView.reloadData()
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getAllDataInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventInfoTableViewCell") as! eventInfoTableViewCell
        var l = getAllDataInfo.object(at:  indexPath.row) as! EventModel
        
        cell.enameUIField.text! = l.eventName
        cell.dateTimeUIField.text! = l.eventDateTime
        return cell
    }
}

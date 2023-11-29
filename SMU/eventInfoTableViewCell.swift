//
//  eventInfoTableViewCell.swift
//  SMU
//
//  Created by Swati Bhandare on 11/23/23.
//

import UIKit

class eventInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var enameUIField: UILabel!
   
    
    @IBOutlet weak var dateTimeUIField: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  FamilyMemberTableViewCell.swift
//  SMU
//
//  Created by Swati Bhandare on 10/21/23.
//

import UIKit

class FamilyMemberTableViewCell: UITableViewCell {

    @IBOutlet weak var fnameLbl: UILabel!
    
    @IBOutlet weak var lnameLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

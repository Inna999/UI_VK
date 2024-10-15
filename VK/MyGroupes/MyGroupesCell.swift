//
//  MyGroupesCell.swift
//  VK
//
//  Created by  Admin on 07.10.2024.
//

import UIKit

class MyGroupesCell: UITableViewCell {

    @IBOutlet weak var groupAvatar: UIImageView!
    
    @IBOutlet weak var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

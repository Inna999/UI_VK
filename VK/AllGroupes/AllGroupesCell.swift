//
//  AllGroupesCell.swift
//  VK
//
//  Created by  Admin on 07.10.2024.
//

import UIKit

class AllGroupesCell: UITableViewCell {

    @IBOutlet weak var groupAvatar: UIImageView!
    
    @IBOutlet weak var groupName: UILabel!
    
    @IBOutlet weak var followersCount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

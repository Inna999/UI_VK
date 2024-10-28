//
//  LentaViewCell.swift
//  VK
//
//  Created by Inna on 17.10.2024.
//

import UIKit

class LentaNewsCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
   
    @IBOutlet weak var imageNews: UIImageView!
    
    @IBOutlet weak var article: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  ItemTableViewCell.swift
//  HinakkoKadai15
//
//  Created by Hina on 2023/07/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var checkImg: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

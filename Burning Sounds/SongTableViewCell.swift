//
//  SongTableViewCell.swift
//  Burning Sounds
//
//  Created by Eugen on 22/09/15.
//  Copyright © 2015 olgen. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet var songImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

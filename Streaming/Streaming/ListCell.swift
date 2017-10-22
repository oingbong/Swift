//
//  ListCell.swift
//  Streaming
//
//  Created by Dkbmc Developer on 2017. 10. 15..
//  Copyright © 2017년 oingbong. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var SingerLabel: UILabel!
    @IBOutlet weak var AlbumLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

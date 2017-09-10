//
//  MainCell.swift
//  CoinDeal
//
//  Created by Dkbmc Developer on 2017. 9. 10..
//  Copyright © 2017년 oingbong. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

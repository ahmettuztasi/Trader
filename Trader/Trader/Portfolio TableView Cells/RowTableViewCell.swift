//
//  tableRowCell.swift
//  Trader
//
//  Created by admin on 2.05.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import UIKit

class RowTableViewCell: UITableViewCell {
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var lastPxLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setRow(symbol: String, amount: Double, lastPx: Double) {
        self.symbolLabel.text = symbol
        self.amountLabel.text = String(amount)
        self.lastPxLabel.text = String(lastPx)
        self.priceLabel.text  = String(amount * lastPx)
    }
}

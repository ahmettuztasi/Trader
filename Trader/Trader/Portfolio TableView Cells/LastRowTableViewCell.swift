//
//  LastRowTableViewCell.swift
//  Trader
//
//  Created by admin on 2.05.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import UIKit

class LastRowTableViewCell: UITableViewCell {

    @IBOutlet weak var grandTotalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func calculateGrandTotal(portfolio: PortfolioModel) {
        var grandTotal: Double = 0
        for item in portfolio.item {
            grandTotal += item.lastPx * Double(item.qtyT2)
        }

        self.grandTotalLabel.text = String(grandTotal)
    }
}

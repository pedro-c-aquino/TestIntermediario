//
//  TableViewCell.swift
//  TestIntermediario
//
//  Created by user208023 on 6/3/22.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var coinLabel: UILabel!
    
    @IBOutlet weak var coinRate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(label: String, rate: Rates) {
        let rateString = String(format: "%.2f", rate.rate)
        self.coinLabel.text = label
        self.coinRate.text = "US$ \(rateString)"
        
    }
    
}

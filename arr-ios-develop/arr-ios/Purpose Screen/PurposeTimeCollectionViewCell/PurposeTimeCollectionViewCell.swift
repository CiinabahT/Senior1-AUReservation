//
//  PurposeTimeCollectionViewCell.swift
//  arr-ios
//
//  Created by Voraruethai Chancharung on 17/5/2564 BE.
//

import UIKit
import SwiftUI

class PurposeTimeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var quatoStackView: UIStackView!
    @IBOutlet weak var backgroundTimeView: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if (isSelected) {
                self.backgroundTimeView.layer.borderColor = UIColor(red:187/255, green:35/255, blue:50/255, alpha: 1).cgColor
                backgroundTimeView.layer.backgroundColor = UIColor(red:187/255, green:35/255, blue:50/255, alpha: 0.05).cgColor
                dayLabel.textColor = UIColor(red:187/255, green:35/255, blue:50/255, alpha: 1)
                dateLabel.textColor = UIColor(red:187/255, green:35/255, blue:50/255, alpha: 1)
            } else {
                backgroundTimeView.layer.borderColor = UIColor(red:227/255, green:227/255, blue:227/255, alpha: 1).cgColor
                backgroundTimeView.layer.backgroundColor = UIColor(red:227/255, green:227/255, blue:227/255, alpha: 0.05).cgColor
                dayLabel.textColor = UIColor(red:120/255, green:120/255, blue:120/255, alpha: 1)
                dateLabel.textColor = UIColor(red:120/255, green:120/255, blue:120/255, alpha: 1)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        var numQuota = 6
        
        backgroundTimeView.layer.cornerRadius = 10
        self.backgroundTimeView.layer.borderWidth = 2
        backgroundTimeView.layer.borderColor = UIColor(red:227/255, green:227/255, blue:227/255, alpha: 1).cgColor
        backgroundTimeView.layer.backgroundColor = UIColor(red:227/255, green:227/255, blue:227/255, alpha: 0.05).cgColor
        
        dayLabel.textColor = UIColor(red:120/255, green:120/255, blue:120/255, alpha: 1)
        dateLabel.textColor = UIColor(red:120/255, green:120/255, blue:120/255, alpha: 1)
        
        for i in 1...numQuota {
            let view = QuotaView.instanceFromNib()
            let vi = UIView()
            vi.backgroundColor = .white
            if ((i == 1) || (i == numQuota)) {
                quatoStackView.addArrangedSubview(vi)
            } else {
                quatoStackView.addArrangedSubview(view)
            }
        }
    }
    
}



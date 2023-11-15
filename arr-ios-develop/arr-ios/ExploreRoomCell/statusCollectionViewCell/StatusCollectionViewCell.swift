//
//  StatusCollectionViewCell.swift
//  arr-ios
//
//  Created by Voraruethai Chancharung on 5/6/2564 BE.
//

import UIKit

class StatusCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundStatusView: UIView!
    @IBOutlet weak var backgroundDateView: UIView!
    @IBOutlet weak var iconStatusImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundStatusView.layer.cornerRadius = 10
        backgroundDateView.layer.cornerRadius = 10
        backgroundStatusView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        backgroundDateView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    public func setCell(data: BookingStatusModel) {
        if (data.status == "finish") {
            backgroundDateView.backgroundColor = UIColor(red: 189/255, green: 32/255, blue: 46/255, alpha: 1)
            backgroundStatusView.backgroundColor = UIColor(red: 250/255, green: 239/255, blue: 240/255, alpha: 1)
            let image = UIImage(systemName: "checkmark.circle.fill")
            self.iconStatusImageView.image = image
            iconStatusImageView.image = iconStatusImageView.image?.withRenderingMode(.alwaysTemplate)
            iconStatusImageView.tintColor = UIColor(red: 189/255, green: 32/255, blue: 46/255, alpha: 1)
            dateLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            dateLabel.text = data.date
            dateLabel.font = UIFont.boldSystemFont(ofSize: 10)
            
        } else if (data.status == "wating") {
            backgroundDateView.backgroundColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
            backgroundStatusView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
            let image = UIImage(systemName: "hourglass.start")
            self.iconStatusImageView.image = image
            iconStatusImageView.image = iconStatusImageView.image?.withRenderingMode(.alwaysTemplate)
            iconStatusImageView.tintColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
            dateLabel.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
            dateLabel.text = data.date
            dateLabel.font = UIFont.boldSystemFont(ofSize: 10)
            
        } else {
            backgroundDateView.backgroundColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
            backgroundStatusView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
            dateLabel.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
            dateLabel.text = ""
            iconStatusImageView.image = nil
        }
    }
    
}

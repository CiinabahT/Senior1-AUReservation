//
//  ExploreRoomCollectionViewCell.swift
//  arr-ios
//
//  Created by Voraruethai Chancharung on 3/2/2564 BE.
//

import UIKit

class ExploreRoomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var roomImage: UIImageView!
    @IBOutlet weak var backgroundPeopleView: UIView!
    @IBOutlet weak var numberPeopleLabel: UILabel!
    @IBOutlet weak var nameRoomLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var data = ["room","6","Swift Room D*Code Laboratory", "09:00 - 16:00"]
    static var identifier = "cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundViewCell?.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        backgroundViewCell.layer.cornerRadius = 10
        backgroundViewCell.clipsToBounds = true
        roomImage.image = UIImage(named: data[0])
        backgroundPeopleView.layer.cornerRadius = 10
        numberPeopleLabel.text = data[1]
        nameRoomLabel.text = data[2]
        nameRoomLabel.font = UIFont.boldSystemFont(ofSize: 14)
        timeLabel.text = data[3]
        timeLabel.textColor = UIColor(red: 135/255, green: 135/255, blue: 135/255, alpha: 1)
    }

    func configure (model: BookingModel) {
        let paragraphStyle = NSMutableParagraphStyle()
        let attrString = NSMutableAttributedString(string: model.text)
        paragraphStyle.lineSpacing = 2
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        nameRoomLabel.attributedText = attrString
    }
    
}

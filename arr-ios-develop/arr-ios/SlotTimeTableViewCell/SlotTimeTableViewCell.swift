//
//  SlotTimeTableViewCell.swift
//  arr-ios
//
//  Created by Voraruethai Chancharung on 6/2/2564 BE.
//

import UIKit

class SlotTimeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backGroundViewCell: UIView!
    @IBOutlet weak var cornerView: UIView!
    @IBOutlet weak var checkPointCornerView: UIView!
    @IBOutlet weak var slotTimeView: UIView!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var forwardImageView: UIImageView!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var titleSlotTime: UILabel!
    @IBOutlet weak var checkPointView: UIView!
    
    let slotTimeTableViewCellID = "slotTimeTableViewCellID"
    
    var data = ["09:00","09:30","Available"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backGroundViewCell.layer.cornerRadius = 10
        slotTimeView.layer.cornerRadius = 10
        startTimeLabel.text = data[0]
        endTimeLabel.text = data[1]
        titleSlotTime.text = data[2]
        checkPointView.layer.cornerRadius = 46
        checkPointView.clipsToBounds = true
        checkPointCornerView.roundCornerView(corners: [.bottomRight], radius: 10)
        cornerView.roundCornerView(corners: [.bottomLeft], radius: 10)
    }
    
}

extension UIView{
    
    func roundCornerView(corners: UIRectCorner, radius: CGFloat)  {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: .init(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

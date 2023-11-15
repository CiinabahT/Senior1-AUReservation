//
//  TimeSlotHeader.swift
//  arr-ios
//
//  Created by Toon on 13/2/2564 BE.
//

import UIKit

class TimeSlotHeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var status: UIView!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var room: UILabel!
    @IBOutlet weak var timeStatus: UIView!
    @IBOutlet weak var roomStatus: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roomStatus.layer.cornerRadius = 8
        timeStatus.layer.cornerRadius = 10
        status.layer.cornerRadius = 11
        statusView.layer.cornerRadius = 13
    }
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        Bundle.main.loadNibNamed("TimeSlotHeader", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}

//
//  QuotaView.swift
//  arr-ios
//
//  Created by Voraruethai Chancharung on 23/5/2564 BE.
//

import Foundation
import UIKit

class QuotaView: UIView{
    
    @IBOutlet weak var quotaPointView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "QuotaView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
}

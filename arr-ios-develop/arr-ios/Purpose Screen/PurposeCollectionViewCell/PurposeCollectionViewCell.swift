//
//  PurposeCollectionViewCell.swift
//  arr-ios
//
//  Created by Toon on 8/4/2564 BE.
//

import UIKit

class PurposeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var purposeButton: UIButton!
    
    let purposeTableViewCellID = "purposeTableViewCellID"
    var isChosen: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        purposeButton.layer.cornerRadius = 10
        purposeButton.isEnabled = false
        purposeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        purposeButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    public func setData(data: NamePurposeModel) {
        purposeButton.setTitle(data.name, for: .normal)
        purposeButton.titleLabel?.numberOfLines = 1
        purposeButton.titleLabel?.adjustsFontSizeToFitWidth = true
        purposeButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
        isChosen = data.isClick
    }
    
}



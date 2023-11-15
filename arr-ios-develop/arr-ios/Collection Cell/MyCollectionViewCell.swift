//
//  MyCollectionViewCell.swift
//  arr-ios
//
//  Created by Toon on 4/2/2564 BE.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView : UIImageView!
    @IBOutlet var myLabel2: UILabel!
    @IBOutlet var mylabel3: UILabel!
    @IBOutlet var mylabel4: UILabel!
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        myLabel2.layer.cornerRadius = 10
        myLabel2.clipsToBounds = true
        
        mylabel3.layer.cornerRadius = 10
        mylabel3.clipsToBounds = true
        
        mylabel4.layer.cornerRadius = 15
        mylabel4.clipsToBounds = true

    }
    
    public func configure(with model: Model ){
        self.myLabel.text = model.text
        self.myImageView.image = UIImage(named: model.imageName)
    }

}

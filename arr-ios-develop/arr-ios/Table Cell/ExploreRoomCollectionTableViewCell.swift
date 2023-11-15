//
//  CollectionTableViewCell.swift
//  arr-ios
//
//  Created by Toon on 4/2/2564 BE.
//

import UIKit

class ExploreRoomCollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView: UICollectionView!
    
    static let identifier = "ExploreRoomCollectionTableViewCellID"
    var models = [BookingModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: "ExploreRoomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ExploreRoomCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ExploreRoomCollectionTableViewCell", bundle: nil)
    }
    
    func configure(with models: [BookingModel]) {
        self.models = models
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models .count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreRoomCollectionViewCell.identifier, for: indexPath) as! ExploreRoomCollectionViewCell
        cell.configure(model: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}


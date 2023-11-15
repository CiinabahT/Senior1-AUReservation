//
//  CollectionViewController.swift
//  arr-ios
//
//  Created by Voraruethai Chancharung on 1/2/2564 BE.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    var data = [["Swift Room D*Code Laboratory","09:00 - 16:00","room","6"],["Swift Room D*Code Laboratory","09:00 - 16:00","room","6"],["Swift Room D*Code Laboratory","09:00 - 16:00","room","6"],["Swift Room D*Code Laboratory","09:00 - 16:00","room","6"],["Swift Room D*Code Laboratory","09:00 - 16:00","room","6"],["Swift Room D*Code Laboratory","09:00 - 16:00","room","6"],["Swift Room D*Code Laboratory","09:00 - 16:00","room","6"],["Swift Room D*Code Laboratory","09:00 - 16:00","room","6"],["Swift Room D*Code Laboratory","09:00 - 16:00","room","6"],["Swift Room D*Code Laboratory","09:00 - 16:00","room","6"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell {
            let item = indexPath.item
            cell.cellView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
            cell.cellView.layer.cornerRadius = 10
            cell.titleLabel.text = "\(data[item][0])"
            cell.subLabel.text = "\(data[item][1])"
            cell.peopleLabel.text = "\(data[item][3])"
            cell.roomImage.image = UIImage(named: data[item][2])
            return cell
        }
        return UICollectionViewCell()
    }
    
}

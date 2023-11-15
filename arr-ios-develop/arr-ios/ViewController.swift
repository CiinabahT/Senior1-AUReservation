//
//  ViewController.swift
//  arr-ios
//
//  Created by Sanpawat Sewsuwan on 28/1/2564 BE.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    ,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var idUserLabel: UILabel!
    @IBOutlet weak var backgroundNumberNotifyBookingView: UIView!
    @IBOutlet weak var numberNotifyBookingLabel: UILabel!
    @IBOutlet weak var leftSideBarLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet var exploreRoomTableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var backgroundNumberStatusView: UIView!
    @IBOutlet weak var nextImageView: UIImageView!
    @IBOutlet weak var numberStatusLabel: UILabel!
    @IBOutlet weak var iconCheckImageView: UIImageView!
    @IBOutlet weak var backgroundWarningView: UIView!
    @IBOutlet weak var backgroundMyBookingView: UIView!
    @IBOutlet weak var iconCreateImageView: UIImageView!
    @IBOutlet weak var tableLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var myBookingView: UIView!
    @IBOutlet weak var warningView: UIView!
    @IBOutlet weak var tableView: UIView!
    
    let statusCollectionViewCellID = "StatusCollectionViewCellID"
    let createCellNib = UINib(nibName: "StatusCollectionViewCell", bundle: nil)
    var bookingStatusModel: [BookingStatusModel] = [BookingStatusModel(date: "22 JUN",status: "finish"),BookingStatusModel(date: "25 JUN",status: "wating"),BookingStatusModel(date: "26 JUN",status: "wating"),BookingStatusModel(date: "",status: "blank"),BookingStatusModel(date: "",status: "blank")]
    var bookingModel = [BookingModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var count = bookingStatusModel.count
        
        bookingModel.append(BookingModel(text: "Swift Room D*Code Laboratory", imageName: "room"))
        bookingModel.append(BookingModel(text: "Swift Room D*Code ", imageName: "room"))
        bookingModel.append(BookingModel(text: "Swift Room D*Code Laboratory", imageName: "room"))
        bookingModel.append(BookingModel(text: "Swift Room D*Code ", imageName: "room"))
        
        if (count == 0) {
            myBookingView.isHidden = true
            warningView.isHidden = true
        }
        
        exploreRoomTableView.register(ExploreRoomCollectionTableViewCell.nib(), forCellReuseIdentifier: ExploreRoomCollectionTableViewCell.identifier)
        exploreRoomTableView.delegate = self
        exploreRoomTableView.dataSource = self
        exploreRoomTableView.separatorStyle = .none
        exploreRoomTableView.showsVerticalScrollIndicator = false
        
        self.view.bringSubviewToFront(backgroundNumberNotifyBookingView)
        idUserLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        userImageView.layer.cornerRadius = 25
        userImageView.clipsToBounds = true
        
        leftSideBarLabel.layer.cornerRadius = 4
        leftSideBarLabel.clipsToBounds = true
        
        backgroundWarningView.layer.cornerRadius = 10
        backgroundWarningView.layer.borderWidth = 1
        backgroundWarningView.layer.borderColor = UIColor(red:235/255, green:183/255, blue:9/255, alpha: 1).cgColor
        backgroundWarningView.layer.backgroundColor = UIColor(red:235/255, green:183/255, blue:9/255, alpha: 0.11).cgColor
        
        warningLabel.textColor = UIColor(red:235/255, green:183/255, blue:9/255, alpha: 1)
        
        collectionView.register(createCellNib, forCellWithReuseIdentifier: statusCollectionViewCellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        backgroundMyBookingView.layer.borderWidth = 1
        backgroundMyBookingView.layer.borderColor = UIColor(red:242/255, green:242/255, blue:242/255, alpha: 1).cgColor
        backgroundMyBookingView.layer.cornerRadius = 10
        
        iconCreateImageView.tintColor = UIColor(red: 189/255, green: 32/255, blue: 46/255, alpha: 1)
        backgroundNumberStatusView.layer.cornerRadius = 10
        iconCheckImageView.tintColor = UIColor(red: 189/255, green: 32/255, blue: 46/255, alpha: 1)
        nextImageView.tintColor = UIColor(red: 98/255, green: 98/255, blue: 98/255, alpha: 1)
        backgroundNumberNotifyBookingView.layer.cornerRadius = 11.5
        numberNotifyBookingLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        numberStatusLabel.textColor = UIColor(red: 189/255, green: 32/255, blue: 46/255, alpha: 1)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableLayoutConstraint.constant = exploreRoomTableView.contentSize.height
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookingStatusModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: statusCollectionViewCellID, for: indexPath) as? StatusCollectionViewCell {
            cell.setCell(data: bookingStatusModel[indexPath.row])
            return cell
        }
        return CollectionViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookingModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExploreRoomCollectionTableViewCell.identifier, for: indexPath) as! ExploreRoomCollectionTableViewCell
        cell.configure(with: bookingModel)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260.0
    }
    
}



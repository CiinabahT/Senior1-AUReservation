//
//  TimeSlotViewController.swift
//  arr-ios
//
//  Created by Toon on 11/2/2564 BE.
//

import UIKit

class TimeSlotViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var TimeSlotHeader: TimeSlotHeaderView!
    
    @IBOutlet weak var timeSlotTableView: UITableView!
    
    let CreateTableViewCellID = "CreateReuseCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let createCellNib = UINib(nibName: "SlotTimeTableViewCell", bundle: nil)
        timeSlotTableView.register(createCellNib, forCellReuseIdentifier: CreateTableViewCellID)
        
        timeSlotTableView.delegate = self
        timeSlotTableView.dataSource = self
        self.timeSlotTableView.separatorStyle = .none
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if let cell = timeSlotTableView.dequeueReusableCell(withIdentifier: CreateTableViewCellID,for: indexPath) as? SlotTimeTableViewCell
       {return cell}
       else {return UITableViewCell()}
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
    

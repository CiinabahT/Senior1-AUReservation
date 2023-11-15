//
//  PurposeViewController.swift
//  arr-ios
//
//  Created by Toon on 6/4/2564 BE.
//

import UIKit

class PurposeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{
    
    @IBOutlet weak var backgroundFormView: UIView!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var backgroundWarningView: UIView!
    @IBOutlet weak var timeCollectionView: UICollectionView!
    @IBOutlet weak var purposeCollectionView: UICollectionView!
    @IBOutlet weak var timeSlotHeaderView: TimeSlotHeaderView!
    @IBOutlet weak var createBookingButton: UIButton!
    @IBOutlet weak var backgroundTimeBookingView: UIView!
    @IBOutlet weak var timeBookingLabel: UILabel!
    @IBOutlet weak var fromTimeTextField: UITextField!
    @IBOutlet weak var toTimeTextField: UITextField!
    @IBOutlet weak var meetingTextField: UITextField!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    let purposeTimeCollectionViewCellID = "PurposeTimeCollectionViewCellID"
    let purposeCollectionViewCellID = "PurposeCollectionViewCellID"
    
    var count = 0
    var currentClick :IndexPath?
    var timePurpose: [TimePurpose] = [TimePurpose(day: "THU", date: "22", quota: 0,isClick: true ),TimePurpose(day: "FRI", date: "23", quota: 0,isClick: false),TimePurpose(day: "SAT", date: "24", quota: 0,isClick: false),TimePurpose(day: "SUN", date: "25", quota: 0,isClick: false),TimePurpose(day: "MON", date: "26", quota: 0,isClick: false),TimePurpose(day: "THU", date: "27", quota: 0,isClick: false),TimePurpose(day: "WED", date: "28", quota: 0,isClick: false)]
    var pickerView = UIPickerView()
    var dataSource = ["09:00","09:30","10:00","10:30","11:00","11:30","12:00"]
    var namePurposeModel: [NamePurposeModel] = [NamePurposeModel(name: "Group Project", isClick: false), NamePurposeModel(name: "Club Meeting", isClick: false), NamePurposeModel(name: "Project Presentation" , isClick: false), NamePurposeModel(name: "Group Study", isClick: false), NamePurposeModel(name: "Advising", isClick: false), NamePurposeModel(name: "Miscellaneous", isClick: false), NamePurposeModel(name: "Miscellaneous", isClick: false), NamePurposeModel(name: "Miscellaneous", isClick: false), NamePurposeModel(name: "Miscellaneous", isClick: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        let createPurposeCellNib = UINib(nibName: "PurposeCollectionViewCell", bundle: nil)
        purposeCollectionView.register(createPurposeCellNib, forCellWithReuseIdentifier: purposeCollectionViewCellID)
        purposeCollectionView.delegate = self
        purposeCollectionView.dataSource = self
        
        purposeCollectionView.allowsMultipleSelection = false
        let createCellNib = UINib(nibName: "PurposeTimeCollectionViewCell", bundle: nil)
        timeCollectionView.register(createCellNib, forCellWithReuseIdentifier: purposeTimeCollectionViewCellID)
        timeCollectionView.delegate = self
        timeCollectionView.dataSource = self
        
        createBookingButton.layer.cornerRadius = 20
        createBookingButton.setTitle("Create Booking", for: .normal)
        createBookingButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        backgroundWarningView.layer.cornerRadius = 10
        backgroundWarningView.layer.borderWidth = 1
        backgroundWarningView.layer.borderColor = UIColor(red:235/255, green:183/255, blue:9/255, alpha: 1).cgColor
        backgroundWarningView.layer.backgroundColor = UIColor(red:235/255, green:183/255, blue:9/255, alpha: 0.1).cgColor
        warningLabel.textColor = UIColor(red:235/255, green:183/255, blue:9/255, alpha: 1)
        
        timeBookingLabel.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
        backgroundTimeBookingView.layer.cornerRadius = 10
        backgroundFormView.layer.cornerRadius = 10
        fromTimeTextField.text = "09:00 HRS."
        toTimeTextField.text = "09:30 HRS."
        
        pickerView.delegate = self
        pickerView.dataSource = self
        fromTimeTextField.inputView = pickerView
        toTimeTextField.inputView = pickerView
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.backgroundColor = UIColor.darkText
        toolbar.sizeToFit()
        
        let btDoneFrom = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.buttonDoneDidTapFrom))
        
        toolbar.setItems([btDoneFrom], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        fromTimeTextField.inputAccessoryView = toolbar
        toTimeTextField.inputAccessoryView = toolbar
        timeCollectionView.showsHorizontalScrollIndicator = false
        timeCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .right)
        meetingTextField.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("content size: \(purposeCollectionView.contentSize)")
        collectionViewHeightConstraint.constant = purposeCollectionView.contentSize.height
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -150, up: true)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -150, up: false)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.2
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    @objc func buttonDoneDidTapFrom() {
        fromTimeTextField.resignFirstResponder()
        toTimeTextField.resignFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (fromTimeTextField.isFirstResponder) {
            fromTimeTextField.text = dataSource[row] + " HRS."
        } else {
            toTimeTextField.text = dataSource[row] + " HRS."
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == purposeCollectionView) {
            return namePurposeModel.count
        }
        return timePurpose.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == purposeCollectionView) {
            return CGSize(width: 170, height: 60)
        }
        return CGSize(width: 56, height: 94)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == purposeCollectionView) {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: purposeCollectionViewCellID, for: indexPath) as? PurposeCollectionViewCell {
            cell.setData(data: namePurposeModel[indexPath.row])
            return cell
            }
        }
        if let cell = timeCollectionView.dequeueReusableCell(withReuseIdentifier: purposeTimeCollectionViewCellID, for: indexPath) as? PurposeTimeCollectionViewCell {
            cell.dayLabel.text = timePurpose[indexPath.row].day
            cell.dateLabel.text = timePurpose[indexPath.row].date
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == purposeCollectionView) {
            if let cell = collectionView.cellForItem(at: indexPath) as? PurposeCollectionViewCell {
                cell.purposeButton.backgroundColor = UIColor(red: 0.87, green: 0.12, blue: 0.17, alpha: 1.00)
                cell.purposeButton.setTitleColor(UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.00), for: .normal)
                cell.purposeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if (collectionView == purposeCollectionView) {
            if let cell = collectionView.cellForItem(at: indexPath) as? PurposeCollectionViewCell {
                cell.purposeButton.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
                cell.purposeButton.setTitleColor(UIColor(red: 142.0/255, green: 142.0/255, blue: 147.0/255, alpha: 1.00), for: .normal)
                cell.purposeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            }
        }
    }
    
}






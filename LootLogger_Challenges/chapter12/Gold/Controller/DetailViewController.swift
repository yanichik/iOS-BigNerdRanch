//
//  DetailViewController.swift
//  LootLogger
//
//  Created by YB on 2/20/24.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialNumberField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = numberFormatter.string(for: item.valueInDollars)
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
        
        let changeDateButton = UIButton(primaryAction: UIAction(title: "Change Date") {_ in
            self.changeDateButton()
        })
        changeDateButton.translatesAutoresizingMaskIntoConstraints = false
        let centerConstraint = changeDateButton.centerXAnchor.constraint(equalTo: dateLabel.centerXAnchor)
        let topConstraint = changeDateButton.topAnchor.constraint(equalTo: dateLabel.centerYAnchor, constant: 15)
        view.addSubview(changeDateButton)
        centerConstraint.isActive = true
        topConstraint.isActive = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Clear first responder
        view.endEditing(true)
        
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text ?? ""
        if let valueText = valueField.text,
           let value = numberFormatter.number(from: valueText) {
            item.valueInDollars = value.intValue
        }
        else {
            item.valueInDollars = 0
        }
    }
    
    // Dismiss keyboard upon pressing Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func changeDateButton(){
        print("change date pressed")
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date

        let changeDateViewController = EditDateViewController(datePicker: datePicker, item: self.item)
        changeDateViewController.view.backgroundColor = UIColor.white
        changeDateViewController.title = "Change Date"
        changeDateViewController.navigationItem.backButtonTitle = "Back to Item"
        changeDateViewController.view.addSubview(datePicker)

        datePicker.topAnchor.constraint(equalTo: changeDateViewController.view.topAnchor).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: changeDateViewController.view.bottomAnchor).isActive = true
        datePicker.centerXAnchor.constraint(equalTo: changeDateViewController.view.centerXAnchor).isActive = true
        navigationController?.pushViewController(changeDateViewController, animated: false)
    }
    
    

}

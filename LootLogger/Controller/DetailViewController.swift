//
//  DetailViewController.swift
//  LootLogger
//
//  Created by YB on 2/20/24.
//

import UIKit

class DetailViewController: UIViewController {
    var item: Item!
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialNumberField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = "$\(item.valueInDollars)"
        dateLabel.text = "\(item.dateCreated)"
        
    }
}

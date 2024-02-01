//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by YB on 1/11/24.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet{
            updateCelsiusLabel()
        }
    }
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCelsiusLabel()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let colors = [UIColor.black, UIColor.blue, UIColor.gray, UIColor.green, UIColor.red]
        view.backgroundColor = colors.randomElement()
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField){
//        Version1: update celsiusLabel text immediately with textField
//        if let text = textField.text, !text.isEmpty {
//            celsiusLabel.text = textField.text
//        } else {
//            celsiusLabel.text = "???"
//        }
        
//      Version2: update fahrenheitValue which calls the updateCelsiusLabel method
        if let text = textField.text, let value = Double(text){
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel(){
        if let celsiusValue = celsiusValue{
            celsiusLabel.text = "\(celsiusValue.value.rounded(to: 2))"
        } else {
            celsiusLabel.text = "???"
        }
    }
}
extension Double {
    func rounded(to places: Int) -> Double{
        return Double(String(format: "%.\(places)f", self))!
    }
}

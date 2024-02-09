//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by YB on 1/11/24.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    var textFieldDelegate: UITextFieldDelegate?
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
    
    // NumberFormatter customizes the display of a number
    // NumberFormatter has a locale property, which is set to the device’s current locale.
    // Whenever you use a NumberFormatter to create a number, it checks its locale property and sets the format accordingly.
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }()
    override func loadView() {
        super.loadView()
        if let textField = textField {
            textField.delegate = self
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
        if let text = textField.text, let value = numberFormatter.number(from: text){
            fahrenheitValue = Measurement(value: value.doubleValue, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel(){
        if let celsiusValue = celsiusValue{
            // using Double extension
            // celsiusLabel.text = "\(celsiusValue.value.rounded(to: 2))"
            
            // using number formatter
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."

        let existingStringHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
        let newStringHasDecimalSeparator = string.range(of: decimalSeparator)
        
        // Bool whether new char is alphabetic using CharacterSet
        let lettersSet = CharacterSet.letters
        var newStringHasAlphabeticCharacter: Bool? = false
        if let stringScalar = string.unicodeScalars.first{
            newStringHasAlphabeticCharacter = lettersSet.contains(stringScalar)
        }
        
        // logic to determine if to print requested character
        if ((existingStringHasDecimalSeparator != nil &&
           newStringHasDecimalSeparator != nil) ||
            newStringHasAlphabeticCharacter! == true)
        {
            return false
        } else {
            return true
        }
    }
}

// MARK: - Double Extension
extension Double {
    func rounded(to places: Int) -> Double{
        return Double(String(format: "%.\(places)f", self))!
    }
}

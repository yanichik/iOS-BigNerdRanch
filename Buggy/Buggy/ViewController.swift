//
//  ViewController.swift
//  Buggy
//
//  Created by YB on 2/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonTapped(_ sender: UIButton){
        //        print("Called buttonTapped(_:)")
        print("Method: \(#function) in file: \(#file) line: \(#line) called.")
        badMethod()
    }
    
    func badMethod() {
        print("Method: \(#function) in file: \(#file) line: \(#line) called.")
        let array = NSMutableArray()
        for i in 0..<10 {
            array.insert(i, at: i)
        }
        // Go one step too far emptying the array (notice the range change):
        for _ in 0..<10 {
            array.removeObject(at: 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}


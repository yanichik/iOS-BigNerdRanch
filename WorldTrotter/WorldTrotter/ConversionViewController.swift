//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by YB on 1/11/24.
//

import UIKit

class ConversionViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let colors = [UIColor.black, UIColor.blue, UIColor.gray, UIColor.green, UIColor.red]
        view.backgroundColor = colors.randomElement()
    }
}

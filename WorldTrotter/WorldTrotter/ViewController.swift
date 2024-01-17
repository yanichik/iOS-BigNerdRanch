//
//  ViewController.swift
//  WorldTrotter
//
//  Created by YB on 1/11/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
//        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
//        let firstView = UIView(frame: firstFrame)
//        firstView.backgroundColor = UIColor.blue
//        view.addSubview(firstView)
//
//        let secondFrame = CGRect(x: 20, y: 30, width: 150, height: 150)
//        let secondView = UIView(frame: secondFrame)
//        secondView.backgroundColor = UIColor.green
//        firstView.addSubview(secondView)
//        view.addSubview(secondView)
    }
    
    override func viewWillLayoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor]
        gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi, 0, 0, 1)
        gradientLayer.frame = view.frame
        let gradientView = UIView()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

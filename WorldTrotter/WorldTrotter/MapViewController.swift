//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by YB on 1/22/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        super.loadView()
        mapView = MKMapView()
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 2
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view = mapView
        view.addSubview(segmentedControl)
        
        // Instead of setting top anchor constraint to the view's topAnchor, setting to offset of view's topAnchor based off of safeAreaLayoutGuide
        // let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        // Instance of view's margins guide
        let margins = view.layoutMarginsGuide
        
        // Instead of using view's leading and trailing anchor, setup constraints based on margins guide
        // let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        // let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded Map VC")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

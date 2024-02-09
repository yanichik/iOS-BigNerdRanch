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
    
    enum MapType: Int{
        case standard
        case hybrid
        case satellite
        
        func toMKMapType() -> MKMapType {
            switch self {
            case .standard:
                return .standard
            case .hybrid:
                return .hybrid
            case .satellite:
                return .satellite
            }
        }
    }
    
    override func loadView() {
        // NOT calling super of loadView when setting view fully programmatically. Need to call super
        // when setting inside IB and customizing programmatically
        // super.loadView()
        mapView = MKMapView()
        
        // Non-Internationalized Version
        // let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        
        // Internationalized Version
        let standardStringInternationalized = NSLocalizedString("Standard", comment: "Displays the standard map.")
        let hybridStringInternationalized = NSLocalizedString("Hybrid", comment: "Displays the hybrid map.")
        let satelliteStringInternationalized = NSLocalizedString("Satellite", comment: "Displays the satellite map.")
        let segmentedControl = UISegmentedControl(items: [standardStringInternationalized, hybridStringInternationalized, satelliteStringInternationalized])
        
        segmentedControl.backgroundColor = UIColor.secondaryLabel
        segmentedControl.selectedSegmentIndex = 0
        if let mapType = MapType(rawValue: segmentedControl.selectedSegmentIndex){
            mapView.mapType = mapType.toMKMapType()
        }
        mapView.setCenter(CLLocationCoordinate2D(latitude: 37.8, longitude: -122.4), animated: true)
        mapView.isZoomEnabled = true
        
        // MKMap Configuration
        let mapConfig = MKStandardMapConfiguration()
        let poiFilter = MKPointOfInterestFilter(including: [.airport,.amusementPark, .atm])
        mapConfig.pointOfInterestFilter = poiFilter
        
        mapView.preferredConfiguration = mapConfig

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
        
        // Attaching a target-action pair to the segmented control
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        let poiLabel = UILabel()
        poiLabel.text = "Points of Interest"
        poiLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(poiLabel)
        
        // Need to add constraint AFTER subView added
        let leadingPoiConstraint = poiLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let topPoiConstraint = poiLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 15)
        leadingPoiConstraint.isActive = true
        topPoiConstraint.isActive = true
        
        let poiSwitch = UISwitch()
        // Need to disable "translatesAutoresizingMaskIntoConstraints" - otherwise INTERFERES with programmatically set constraints
        poiSwitch.translatesAutoresizingMaskIntoConstraints = false
        poiSwitch.setOn(true, animated: true)
        view.addSubview(poiSwitch)
        let leadingPoiSwitchConstraint = poiSwitch.leadingAnchor.constraint(equalTo: poiLabel.trailingAnchor, constant: 10)
        let midPoiSwitchConstraint = poiSwitch.centerYAnchor.constraint(equalTo: poiLabel.centerYAnchor)
        
        leadingPoiSwitchConstraint.isActive = true
        midPoiSwitchConstraint.isActive = true
        
        // Attaching a target-action pair to the POI Switch
        poiSwitch.addTarget(self, action: #selector(togglePoiSwitch(_:)), for: .valueChanged)
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
    
    @objc func mapTypeChanged(_ segmentedControl: UISegmentedControl){
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            if let mapType = MapType(rawValue: 0){
                mapView.mapType = mapType.toMKMapType()
            }
        case 1:
            if let mapType = MapType(rawValue: 1){
                mapView.mapType = mapType.toMKMapType()
            }
        case 2:
            if let mapType = MapType(rawValue: 2){
                mapView.mapType = mapType.toMKMapType()
            }
        default:
            if let mapType = MapType(rawValue: 0){
                mapView.mapType = mapType.toMKMapType()
            }
        }
    }
    
    @objc func togglePoiSwitch(_ poiSwitch: UISwitch){
        if poiSwitch.isOn{
            mapView.pointOfInterestFilter = .includingAll
        } else {
            mapView.pointOfInterestFilter = .excludingAll
        }
    }
}

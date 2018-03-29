//
//  SelectPointLocationViewController.swift
//  TestTask
//
//  Created by Алексей Мачнев on 28/03/2018.
//  Copyright © 2018 machnev. All rights reserved.
//

import UIKit
import MapKit

class SelectPointLocationViewController: UITableViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var point : Point?
}

extension SelectPointLocationViewController : UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        //let gestureRecognizer = UITapGestureRecognizer(target: mapView, action: #selector(self.handleTap(gestureReconizer:)));
        //gestureRecognizer.delegate = self
        //mapView.addGestureRecognizer(gestureRecognizer);
    }
    
    @IBAction func handleTap(gestureReconizer: UITapGestureRecognizer) {
        
        let location : CGPoint = gestureReconizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        
        // Create point
        point = Point(lattitude: coordinate.latitude, longitude: coordinate.longitude, name: "")
        
        // Remove all other annotations
        mapView.removeAnnotations(mapView.annotations)
        
        // Add annotation:
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
}

extension SelectPointLocationViewController {
    @IBAction func backToSelectPointLocationViewController(_ seque : UIStoryboardSegue){
        
    }
}

extension SelectPointLocationViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InputPointName" {
            let navViewController = segue.destination as? UINavigationController
            if let inputPointNameViewController = navViewController?.topViewController as? InputPointNameViewController {
                if point != nil  {
                    inputPointNameViewController.point = point!
                }
            }
        }
    }
}

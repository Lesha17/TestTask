//
//  ViewSavedPointViewController.swift
//  TestTask
//
//  Created by Алексей Мачнев on 28/03/2018.
//  Copyright © 2018 machnev. All rights reserved.
//

import UIKit
import MapKit

class ViewSavedPointViewController: UITableViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var point : Point?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if point == nil {
            return
        }
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: point!.lattitude, longitude: point!.longitude)
        annotation.title = point!.name
        mapView.addAnnotation(annotation)
    }
}

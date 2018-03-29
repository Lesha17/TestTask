//
//  InputPointNameViewController.swift
//  TestTask
//
//  Created by Алексей Мачнев on 28/03/2018.
//  Copyright © 2018 machnev. All rights reserved.
//

import UIKit

class InputPointNameViewController: UITableViewController {
    
    @IBOutlet weak var pointNameTextField: UITextField!
    
    var point : Point = Point(lattitude: 0, longitude: 0, name: "");
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SavePoint" {
            if let pointName = pointNameTextField.text {
                point.name = pointName
            }
        }
    }
}

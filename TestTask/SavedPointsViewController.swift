//
//  SavedPointsViewController.swift
//  TestTask
//
//  Created by Алексей Мачнев on 28/03/2018.
//  Copyright © 2018 machnev. All rights reserved.
//

import UIKit

class SavedPointsViewController: UITableViewController {
    let pointsManager = PointsManager()
    
    var points : [Point] = []
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        points = pointsManager.getPoints()
    }
}

extension SavedPointsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pointsManager.getPoints().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedPointCell", for: indexPath)
    
        let point = points[indexPath.row]
        cell.textLabel?.text = point.name
        cell.detailTextLabel?.text = "( \(point.lattitude); \(point.longitude))"
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete {
            pointsManager.deletePoint(index: indexPath.row);
            points = pointsManager.getPoints();
            
            tableView.reloadData()
        }
    }
}

extension SavedPointsViewController {
    
    @IBAction func cancelToSavedPointsViewController(_ segue : UIStoryboardSegue){
        
    }
    
    @IBAction func saveCreatedPoint(_ segue : UIStoryboardSegue){
        let inputPointNameViewController = segue.source as? InputPointNameViewController
        guard let point = inputPointNameViewController?.point else {
            return
        }
        
        pointsManager.addPoint(p: point);
        points = pointsManager.getPoints();
        
        let indexPath = IndexPath(row: pointsManager.getPoints().count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func backToSavedPoints(_ segue : UIStoryboardSegue){
        
    }
}

extension SavedPointsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSavedPoint" {
            if sender is UITableViewCell {
                let cell = sender as! UITableViewCell
                if let indexPath = tableView.indexPath(for: cell) {
                    let point = points[indexPath.row]
                    
                    if let navController = segue.destination as? UINavigationController {
                        if let viewSavedPointController = navController.topViewController as? ViewSavedPointViewController {
                            viewSavedPointController.point = point
                        }
                    }
                }
            }
        }
    }
}

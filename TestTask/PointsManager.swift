//
//  PointsManager.swift
//  TestTask
//
//  Created by Алексей Мачнев on 28/03/2018.
//  Copyright © 2018 machnev. All rights reserved.
//

import UIKit

class PointsManager: NSObject {
    
    static let arrayKey = "keyOfPointsArray"
    
    func getPoints() -> [Point] {
        let userDefaults = UserDefaults.standard;
        let decoded : Data? = userDefaults.object(forKey: PointsManager.arrayKey) as? Data;
        if(decoded != nil){
            let decodedPoints = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! [Point]
            return decodedPoints
        }
        else {
            return []
        }
    }
    
    func addPoint(p : Point) {
        var points = getPoints();
        points.append(p);
        
        let userDefaults = UserDefaults.standard;
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: points);
        userDefaults.set(encodedData, forKey: PointsManager.arrayKey);
        userDefaults.synchronize();
    }
    
    func deletePoint(index : Int) {
        var points = getPoints();
        points.remove(at: index)
        
        let userDefaults = UserDefaults.standard;
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: points);
        userDefaults.set(encodedData, forKey: PointsManager.arrayKey);
        userDefaults.synchronize();
        
    }
}

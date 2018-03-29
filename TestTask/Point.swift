//
//  Point.swift
//  TestTask
//
//  Created by Алексей Мачнев on 26/03/2018.
//  Copyright © 2018 machnev. All rights reserved.
//

import Foundation

class Point : NSObject, NSCoding {
    var lattitude : Double = 0;
    var longitude : Double = 0;
    var name : String = "";
    
    init(lattitude : Double, longitude : Double, name : String?) {
        self.lattitude = lattitude;
        self.longitude = longitude;
        
        if(name != nil){
            self.name = name!;
        }
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let x = aDecoder.decodeDouble(forKey: "lattitude")
        let y = aDecoder.decodeDouble(forKey: "longitude")
        let name = aDecoder.decodeObject(forKey: "name") as! String
        self.init(lattitude: x, longitude: y, name: name)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(lattitude, forKey: "lattitude")
        aCoder.encode(longitude, forKey: "longitude")
        aCoder.encode(name, forKey: "name")
    }
    
}

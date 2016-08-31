//
//  JCIVCYearDataManager.swift
//  VehicleContent
//
//  Created by Mobility on 18/08/16.
//  Copyright © 2016 TCS. All rights reserved.
//

import UIKit

class JCIPTVehicleDataManager: NSObject {
    
    var vehicleArray : [JCIPTVehicle]?
    static var instance: JCIPTVehicleDataManager!
    
    class func sharedInstance() ->JCIPTVehicleDataManager {
        
        self.instance = (self.instance ?? JCIPTVehicleDataManager())
        return self.instance
        
    }
    
}

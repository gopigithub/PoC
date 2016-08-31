//
//  JCIVCComponentDataManager.swift
//  VehicleContent
//
//  Created by Mobility on 18/08/16.
//  Copyright © 2016 TCS. All rights reserved.
//

import UIKit

class JCIPTVehicleDetailDataManager: NSObject {
    
    var vehicleDetailArray : [JCIPTVehicleDetail]?
    static var instance: JCIPTVehicleDetailDataManager!
    
    class func sharedInstance() ->JCIPTVehicleDetailDataManager {
        
        self.instance = (self.instance ?? JCIPTVehicleDetailDataManager())
        return self.instance
    }
    
}

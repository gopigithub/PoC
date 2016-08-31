//
//  JCIVCBaseModel.swift
//  VehicleContent
//
//  Created by Mobility on 17/08/16.
//  Copyright © 2016 TCS. All rights reserved.
//

import UIKit
class JCIPTBaseModel: NSObject {
    
    var vehicleList : [JCIPTVehicle] = []
    
    /* Method to add the json data to the vehicle array */
    func initwithDictionary (jsonDictionary : [String : AnyObject]) {
        for(vehicleName,vehicleData) in jsonDictionary {
            let objVehicleModel = JCIPTVehicle()
            objVehicleModel.initwithArray(vehicleData as! [AnyObject], vehicleName: vehicleName)
            vehicleList.append(objVehicleModel)
        }
    }
}

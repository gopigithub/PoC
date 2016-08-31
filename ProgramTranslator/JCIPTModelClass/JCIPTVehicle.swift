//
//  Vehicle.swift
//  ProgramTranslator
//
//  Created by Mobility on 11/08/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCIPTVehicle: NSObject {
    
    var brandName : String!
    var cbu : String!
    var modelName : String!
    var arrVehicleDetail : [JCIPTVehicleDetail] = []
    
    /* Method to add the json dictionary to maker array */
    
    func initwithArray (vehicleData : [AnyObject] , vehicleName :String) {
        var myStringArr = vehicleName.componentsSeparatedByString("_")
        self.brandName = myStringArr[1]
        self.cbu = myStringArr[0]
        self.modelName = myStringArr[2]
        iterateVehicleData(vehicleData)
    }
    
    func iterateVehicleData(vehicleData :[AnyObject]) {
        for objVehicleDetail in vehicleData {
            let objVehicleDetailData = JCIPTVehicleDetail()
            objVehicleDetailData.initWithVehicleDetailArray(objVehicleDetail as AnyObject)
            arrVehicleDetail.append(objVehicleDetailData)
        }
    }
    
}

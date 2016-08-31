//
//  VehicleDetail.swift
//  ProgramTranslator
//
//  Created by Mobility on 11/08/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCIPTVehicleDetail: NSObject {
    var modelGeneration : String!
    var brandName : String!
    var modelName : String!
    var productName : String!
    var status : String!
    var opportunityRegion : String!
    
    
    func initWithVehicleDetailArray(arrVehicalDetail:AnyObject)
    {
        self.modelGeneration = arrVehicalDetail.valueForKey("year") as! String
        self.brandName = arrVehicalDetail.valueForKey("cbu") as! String
        self.modelName = arrVehicalDetail.valueForKey("model") as! String
        self.productName = arrVehicalDetail.valueForKey("product") as! String
        self.status = arrVehicalDetail.valueForKey("status") as! String
        self.opportunityRegion = arrVehicalDetail.valueForKey("region") as! String
    }
}

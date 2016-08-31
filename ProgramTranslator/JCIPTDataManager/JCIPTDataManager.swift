//
//  JCIVCDataManager.swift
//  VehicleContent
//
//  Created by Mobility on 18/08/16.
//  Copyright © 2016 TCS. All rights reserved.
//

import UIKit

class JCIPTDataManager: NSObject {
    
    static var instance: JCIPTDataManager!
    var vehicleManager : JCIPTVehicleDataManager!
    var vehicleDetailManager : JCIPTVehicleDetailDataManager!
    
    var objVCJSON : JCIPTJSONParsing?
    class func sharedInstance() ->JCIPTDataManager {
        self.instance = (self.instance ?? JCIPTDataManager())
        return self.instance
    }
    
    override init() {
        objVCJSON = JCIPTJSONParsing.init()
        
        vehicleManager = JCIPTVehicleDataManager.sharedInstance()
        vehicleManager.vehicleArray = objVCJSON?.objJCIPTBaseModel.vehicleList
    }
    
    func getVehicleDetail(index : Int) -> JCIPTVehicle
    {
        let vehicleDetailData : JCIPTVehicle = vehicleManager.vehicleArray![index]
        return vehicleDetailData
    }
    
    func getVehicleList() ->[JCIPTVehicle] {
        return vehicleManager.vehicleArray!
    }
    
    func getVehicleDetailList(index : Int) ->[JCIPTVehicleDetail]
    {
        let vehicleData : JCIPTVehicle = getVehicleDetail(index)
        vehicleDetailManager = JCIPTVehicleDetailDataManager.sharedInstance()
        vehicleDetailManager.vehicleDetailArray = vehicleData.arrVehicleDetail
        return vehicleDetailManager.vehicleDetailArray!
        
    }
    
    func getProductDetail(index : Int) -> JCIPTVehicleDetail
    {
        let vehicleDetailData : JCIPTVehicleDetail = vehicleDetailManager.vehicleDetailArray![index]
        return vehicleDetailData
    }
    
}

//
//  JCIVCJSONParsing.swift
//  VehicleContent
//
//  Created by Mobility on 17/08/16.
//  Copyright © 2016 TCS. All rights reserved.
//

import UIKit


let jsonFileName = "programTranslator_input"
let jsonFileFormat = "json"

class JCIPTJSONParsing: NSObject {
    let objJCIPTBaseModel = JCIPTBaseModel()
    
    override init() {
        let jsonPath: NSString = NSBundle.mainBundle().pathForResource(jsonFileName, ofType: jsonFileFormat)!
        let jsonData : NSData = try! NSData(contentsOfFile: jsonPath as String, options: NSDataReadingOptions.DataReadingMapped)
        
        do {
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
            objJCIPTBaseModel.initwithDictionary(jsonResult as! [String : AnyObject])
            
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
    }
}

//
//  JCIPTParser.swift
//  ProgramTranslator
//
//  Created by Mobility on 17/08/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

let kBaseURL = "http://www.learnswiftonline.com/"


class JCIPTParser: NSObject,JCIPTSessionHandlerDelegate {
    
    override init () {
        super.init()
    }
    
    func jsonParser(requestSubString : String)
    {
        let requestURL: NSURL = NSURL(string: kBaseURL + requestSubString)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        
        let objSessionHandler = JCIPTSessionHandler()
        objSessionHandler.sessionHandlerDelegate = self
        
        objSessionHandler.requestData(urlRequest)
    }
    
    func sessionDataCompletedWithError(err : NSError)
    {
        
    }
    func sessionDataCompletedWithSucess(data : NSData)
    {
        do{
            let result = try NSJSONSerialization.JSONObjectWithData(data, options:.AllowFragments)
            print ("Json Result",result)
            
        }catch {
            print("Error with Json: \(error)")
        }
        
    }
    
}

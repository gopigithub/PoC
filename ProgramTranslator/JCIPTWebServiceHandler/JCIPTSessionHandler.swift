//
//  JCIPTSessionHandler.swift
//  ProgramTranslator
//
//  Created by Mobility on 17/08/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit


protocol JCIPTSessionHandlerDelegate {
    
    func sessionDataCompletedWithError(err: NSError)
    func sessionDataCompletedWithSucess(data: NSData)
}

class JCIPTSessionHandler: NSObject,NSURLSessionDelegate {
    
    var sessionHandlerDelegate:JCIPTSessionHandlerDelegate?
    
    
    func requestData(objMutableReq : NSMutableURLRequest)
    {
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(objMutableReq) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                self.sessionHandlerDelegate!.sessionDataCompletedWithSucess(data!)
                
            }
            else
            {
                self.sessionHandlerDelegate!.sessionDataCompletedWithError(error!)
            }
        }
        
        task.resume()
    }
    
}

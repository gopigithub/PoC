//
//  JCIPTProductDetailViewController.swift
//  ProgramTranslator
//
//  Created by Mobility on 11/08/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

let defaulttCellIdentifier = "ProductDetailCell"
let kModelGeneration = "Model Generation     :"
let kCBU = "CBU                              :"
let kModelName = "Model Name               :"
let kStatus = "Status                          :"
let kProduct = "Product                        :"
let kOppurtunityRegion = "Oppurtunity Region  :"

class JCIPTProductDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tblvwProductDetail: UITableView!
    var objVehicleDetail : JCIPTVehicleDetail?
    var vehicleDetailCurrentIndex : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getVehicleData()
    }
    /* Method to get the data of Products */
    func getVehicleData () {
        objVehicleDetail =  JCIPTDataManager.sharedInstance().getProductDetail(vehicleDetailCurrentIndex)
    }
    
    // MARK: - UITableView Datasource & Delegates
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6;
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        // This will create a "invisible" footer
        return 0.01;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = defaulttCellIdentifier
        
        let cell : JCIPTProductDetailTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
            as! JCIPTProductDetailTableViewCell
        
        switch(indexPath.row)
        {
        case 0:
            cell.lblTitle?.text = kModelGeneration
            cell.lblDescription?.text = objVehicleDetail!.modelGeneration
            
        case 1:
            cell.lblTitle?.text = kCBU
            cell.lblDescription?.text = objVehicleDetail!.brandName
            
        case 2:
            cell.lblTitle?.text = kModelName
            cell.lblDescription?.text = objVehicleDetail!.modelName
            
        case 3:
            cell.lblTitle?.text = kProduct
            cell.lblDescription?.text = objVehicleDetail!.productName
            
        case 4:
            cell.lblTitle?.text = kStatus
            cell.lblDescription?.text = objVehicleDetail!.status
            
        case 5:
            cell.lblTitle?.text = kOppurtunityRegion
            cell.lblDescription?.text = objVehicleDetail!.opportunityRegion
            
        default: break
            
        }
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

//
//  JCIPTDetailListViewController.swift
//  ProgramTranslator
//
//  Created by Mobility on 11/08/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

let detailCell = "DetailCell"
let productVCSegue = "ProductDetailVC"

class JCIPTDetailListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tblvwDetailList: UITableView!
    var arrVehicleDetailData : [JCIPTVehicleDetail] = []
    var vehicleArray : [JCIPTVehicle] = []
    var vehicleCurrentIndex : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        getVehicleDetailData()
    }
    /* Method to fetch year data */
    func getVehicleDetailData() {
        
        arrVehicleDetailData =  JCIPTDataManager.sharedInstance().getVehicleDetailList(vehicleCurrentIndex)
        
    }
    // MARK: - UITableView Datasource & Delegates
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return arrVehicleDetailData.count;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 170.0;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : JCIPTDetailTableViewCell = tableView.dequeueReusableCellWithIdentifier(detailCell, forIndexPath: indexPath)
            as! JCIPTDetailTableViewCell
        cell.btnMoreInfo.tag = indexPath.section
        let vehicleDetail: JCIPTVehicleDetail
        vehicleDetail = arrVehicleDetailData[indexPath.section]
        
        cell.lblProductName.text = vehicleDetail.productName
        cell.lblBrandName.text = vehicleDetail.brandName
        cell.lblMakeYear.text = vehicleDetail.modelGeneration
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
    }
    // MARK: - Storyboard Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == productVCSegue{
            let vc = segue.destinationViewController as! JCIPTProductDetailViewController
            //            vc.objVehicleDetail = arrVehicleDetailData[sender.tag]
            vc.vehicleDetailCurrentIndex = sender.tag
            let backItem = UIBarButtonItem()
            
            let str : String = (arrVehicleDetailData[sender.tag].productName)!
            backItem.title = str
            navigationController?.navigationItem.title = nil
            navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
        }
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

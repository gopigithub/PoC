//
//  ViewController.swift
//  ProgramTranslator
//
//  Created by Mobility on 11/08/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

let defaultCellIdentifier = "Cell"
let keyforModelGeneration = "year"
let keyforBrandName = "cbu"
let keyforModelName = "model"
let keyforProductName = "product"
let keyforStaus = "status"
let keyforOpportunityRegion = "region"
let detailListVCSegue = "DetailListVC"

class JCIPTWelcomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    @IBOutlet weak var tblvwVehicleList: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    var dictResult : NSDictionary = [String: String]()
    var arrTempVehicle : [JCIPTVehicle] = []
    var selectedModelName :String = ""
    var selectedIndex : Int = 0
    var searchActive : Bool = false
    var filteredResult : [JCIPTVehicle] = []
    var arrVehicleDetail : [JCIPTVehicleDetail] = []
    let objJCIPTBaseModel = JCIPTBaseModel()
    var objJCIVCDataManager : JCIPTDataManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        objJCIVCDataManager = JCIPTDataManager.sharedInstance()
        tblvwVehicleList.delegate = self
        tblvwVehicleList.dataSource = self
        searchBar.delegate=self
        searchBar.returnKeyType = UIReturnKeyType.Done
        getVehicleData ()
        tblvwVehicleList.registerClass(UITableViewCell.self, forCellReuseIdentifier: defaultCellIdentifier)
        
        let objParser = JCIPTParser()
        objParser.jsonParser("Samples/subway.json")
        
    }
    
    func getVehicleData () {
        arrTempVehicle =  JCIPTDataManager.sharedInstance().getVehicleList()
    }
    
    // MARK: - SearchBar Delegates
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        //        searchActive = true;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        searchActive = false;
        searchBar.resignFirstResponder()
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredResult = arrTempVehicle.filter { $0.cbu.localizedCaseInsensitiveContainsString(searchText) }
        
        if(filteredResult.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        tblvwVehicleList.reloadData()
    }
    
    // MARK: - UITableView Datasource & Delegates
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive)
        {
            return filteredResult.count
        }
        return arrTempVehicle.count
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 50.0;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = defaultCellIdentifier
        let vehicle: JCIPTVehicle
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
        if(searchActive){
            vehicle = filteredResult[indexPath.row]
        } else {
            vehicle =  arrTempVehicle[indexPath.row]
        }
        cell.textLabel?.text = vehicle.cbu+"("+vehicle.modelName+")"
        selectedModelName=vehicle.cbu
        cell.detailTextLabel?.font = UIFont.systemFontOfSize(12.0);
        cell.detailTextLabel?.textColor = UIColor(netHex:0x808000)
        cell.detailTextLabel?.text = vehicle.brandName
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let vehicle: JCIPTVehicle
        if(searchActive){
            vehicle = filteredResult[indexPath.row]
        } else {
            vehicle = arrTempVehicle[indexPath.row]
        }
        selectedModelName=vehicle.cbu
        selectedIndex = indexPath.row
        
        self.performSegueWithIdentifier(detailListVCSegue, sender: self)
        
        searchBar.text=nil
        searchActive = false
        searchBar.resignFirstResponder()
        
        tblvwVehicleList.reloadData()
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation:      UIInterfaceOrientation, duration: NSTimeInterval)
    {
        self.tblvwVehicleList.reloadData()
    }
    
    // MARK: - Storyboard Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == detailListVCSegue {
            let vc = segue.destinationViewController as! JCIPTDetailListViewController
            vc.arrVehicleDetailData = arrVehicleDetail
            vc.vehicleCurrentIndex = selectedIndex
            let backItem = UIBarButtonItem()
            backItem.title = selectedModelName
            navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

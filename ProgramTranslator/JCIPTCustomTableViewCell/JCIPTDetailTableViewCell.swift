//
//  JCIPTDetailTableViewCell.swift
//  ProgramTranslator
//
//  Created by Mobility on 11/08/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCIPTDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var vwBase: UIView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblBrandName: UILabel!
    @IBOutlet weak var lblMakeYear: UILabel!
    @IBOutlet weak var btnMoreInfo: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.vwBase.layer.borderWidth=1
        self.vwBase.layer.borderColor = (UIColor( red: 192/255, green: 192/255, blue:192/255, alpha: 1.0 )).CGColor
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

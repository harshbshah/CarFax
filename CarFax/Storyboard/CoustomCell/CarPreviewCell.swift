//
//  CarPreviewCell.swift
//  CarFax
//
//  Created by Harsh_Dev on 2020-09-17.
//  Copyright © 2020 Pineapple Inc. All rights reserved.
//

import UIKit
import Foundation

class CarPreviewCell: UITableViewCell {

    @IBOutlet weak var callDealerButton: BaseUIButton!
    @IBOutlet weak var locationLabel: BaseUILabel!
    @IBOutlet weak var milageLabel: BaseUILabel!
    
    @IBOutlet weak var priceLabel: BaseUILabel!
    
    @IBOutlet weak var carYearMakeModelLabel: BaseUILabel!
    @IBOutlet weak var carCoverImage: BaseImageView!
    
    
    var carPreviewData:CarPreview?{
        didSet
        {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI()
    {
        DispatchQueue.main.async {
            //Update Labels
        }
    }
    
}

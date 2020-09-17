//
//  CarPreviewCell.swift
//  CarFax
//
//  Created by Harsh_Dev on 2020-09-17.
//  Copyright © 2020 Pineapple Inc. All rights reserved.
//

import UIKit
import Foundation
import SDWebImage
class CarPreviewCell: UITableViewCell {

    @IBOutlet weak var callDealerButton: BaseUIButton!
    @IBOutlet weak var locationLabel: BaseUILabel!
    @IBOutlet weak var milageLabel: BaseUILabel!
    
    @IBOutlet weak var priceLabel: BaseUILabel!
    
    @IBOutlet weak var carYearMakeModelLabel: BaseUILabel!
    @IBOutlet weak var carCoverImage: BaseImageView!
    
    
    var carPreviewData:CarPreview?
    
    
    
    //MARK: UITableView Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.carCoverImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //MARK: setup cell
    func setupCell(carPreviewData : CarPreview){
        
        self.carPreviewData = carPreviewData
        self.updateUI()
        
    }
    
    //MARK: prepare cell for reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        carCoverImage.isHidden = false
        carCoverImage.image = nil
        carCoverImage.sd_cancelCurrentImageLoad()
    }
    
    func updateUI()
    {
        DispatchQueue.main.async {
            //Update Labels
            guard let url = URL.init(string: self.carPreviewData?.carCoverImage ?? "") else{
                self.carCoverImage.isHidden = true
//                self.carCoverImage.constant = 0
                self.carCoverImage.image = nil
                return
            }
            let carYear = self.carPreviewData?.carYear ?? 0
            var carYearString = " "
            if(carYear != 0)
            {
                carYearString  = "\(carYear)"
            }
            self.carYearMakeModelLabel.text = "\(carYearString) \(self.carPreviewData?.carMake ?? "") \(self.carPreviewData?.carModel ?? "") \(self.carPreviewData?.carTrim ?? "")"
            if let _ = self.carPreviewData?.carPrice
            {
                self.priceLabel.text = "$ \(self.carPreviewData?.carPrice ?? 0)"
            }
            self.milageLabel.text = "\(self.carPreviewData?.carMilage ?? "")"
            self.locationLabel.text = "\(self.carPreviewData?.carDealerCity ?? "") , \(self.carPreviewData?.carDelaerState ?? "")"
            if let _ = self.carPreviewData?.carDealaerContact
            {
            self.callDealerButton.setTitle(self.carPreviewData?.carDealaerContact ?? "", for: .normal)
            }
            else
            {
                self.callDealerButton.isHidden = true
            }
//            self.constraintImgThumbHeight.constant = self.frame.size.getimageAspectRatioHeightAccordingToWidth(imageSize: CGSize.init(width: articleDetails.articleThumbnailbWidth, height: articleDetails.articleThumbnailHeight))
            
            //Default image
//            self.carCoverImage.image = UIImage.init(named: "img_PlaceHolder")
            
            self.carCoverImage.sd_setImage(with:url) { (img, error, chachetype, url) in
                self.setNeedsDisplay()
                self.layoutSubviews()
            }
        }
    }
    
}

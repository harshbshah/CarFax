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
protocol CallDealerButtonDelegate : class {
    func callDealerPressed(_ tag: Int)
}
class CarPreviewCell: UITableViewCell {

    @IBOutlet weak var wrapperView: UIView!
    {
        didSet{
        wrapperView.layer.cornerRadius = 5
               wrapperView.layer.shadowOpacity = 1
               wrapperView.layer.shadowRadius = 2
            wrapperView.layer.shadowColor = UIColor.lightGray.cgColor
               wrapperView.layer.shadowOffset = CGSize(width: 3, height: 3)
        }
    }
    var callDealerDelegate: CallDealerButtonDelegate?
    @IBOutlet weak var coverImageHeightConstraint: NSLayoutConstraint!
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
        self.callDealerButton.addTarget(self, action: #selector(makeAcall), for: .touchUpInside)
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
    
    @objc func makeAcall()
    {
        callDealerDelegate?.callDealerPressed(self.callDealerButton.tag)
    }
    
    func updateUI()
    {
        DispatchQueue.main.async {
            //Update Labels
            guard let url = URL.init(string: self.carPreviewData?.carCoverImage ?? "") else{
                self.carCoverImage.isHidden = true
                self.coverImageHeightConstraint.constant = 0
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
            
            let currencyFormatter = NumberFormatter()
            currencyFormatter.usesGroupingSeparator = true
            currencyFormatter.numberStyle = .currency
            // localize to your grouping and decimal separator
            currencyFormatter.locale = Locale.current

            // We'll force unwrap with the !, if you've got defined data you may need more error checking

           
            
            if let _ = self.carPreviewData?.carPrice
            {
                let priceString = currencyFormatter.string(from: NSNumber(value: self.carPreviewData?.carPrice! ?? 0))!
                self.priceLabel.text = priceString
            }
            if let _ = self.carPreviewData?.carMilage
            {
            self.milageLabel.text = "\(self.carPreviewData?.carMilage ?? 0) Mile"
            }
            self.locationLabel.text = "\(self.carPreviewData?.carDealerCity ?? "") , \(self.carPreviewData?.carDelaerState ?? "")"
            if let _ = self.carPreviewData?.carDealaerContact
            {
                
//            self.callDealerButton.setTitle(self.carPreviewData?.carDealaerContact ?? "", for: .normal)
            }
            else
            {
                self.callDealerButton.isHidden = true
            }
            self.coverImageHeightConstraint.constant = self.frame.size.getimageAspectRatioHeightAccordingToWidth(imageSize: CGSize.init(width: self.carPreviewData?.carCoverImagewidth ?? 400, height: self.carPreviewData?.carCoverImageHeight ?? 200))
            
            //Default image
//            self.carCoverImage.image = UIImage.init(named: "img_PlaceHolder")
            
            self.carCoverImage.sd_setImage(with:url) { (img, error, chachetype, url) in
                
                self.setNeedsDisplay()
                self.layoutSubviews()
            }
        }
    }
    
}

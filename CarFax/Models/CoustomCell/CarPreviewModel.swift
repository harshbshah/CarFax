//
//  CarPreviewModel.swift
//  CarFax
//
//  Created by Harsh_Dev on 2020-09-17.
//  Copyright © 2020 Pineapple Inc. All rights reserved.
//

import Foundation

struct CarPreview:Codable
{
    var carCoverImage:String?
    var carYear:Int?
    var carModel:String?
    var carMake:String?
    var carTrim:String?
    var carPrice:Double?
    var carMilage:Int?
    var carDealerCity:String?
    var carDelaerState:String?
    var carDealaerContact:String?
}

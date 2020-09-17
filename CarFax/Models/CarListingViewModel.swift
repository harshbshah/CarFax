//
//  CarListingViewModel.swift
//  CarFax
//
//  Created by Harsh_Dev on 2020-09-17.
//  Copyright © 2020 Pineapple Inc. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
public class CarListingViewModel{
    
    //MARK: Model Object
    var  listing: [Listing] = []
    
    //MARK: Call API To get Data from URL
    func fetchUsedCarDataFromServer(complition: @escaping ((_ success : Bool, _ errorMessage : String?) -> Void)){
        APIManager.shared.processFromURL(apiRequestParam: ApiList.listCars.returnAPIRequestProperties()) { (apiResponse) in
            switch apiResponse.httpStatusCode{
            case 500:
                complition(false, "Internet connection is not working.")
            case 200:
                let jsonDecoder = JSONDecoder.init()
                
                let responseData = try? JSONSerialization.data(withJSONObject:apiResponse.responseData ?? [:])
                guard let usedCarListResponse = try? jsonDecoder.decode(UsedCarListResponse.self, from: responseData ?? Data.init()) else{
                    complition(false,apiResponse.error?.localizedDescription ?? "Failed to fetch data from server.")
                    return
                }
//                let arrayJson = responseData["children"] as? [Dictionary<String,Any>] ?? []
                if let _ = usedCarListResponse.listings
                {
                    self.listing = usedCarListResponse.listings!
                }
                complition(true,nil)
            default:
                complition(false,apiResponse.error?.localizedDescription ?? "Failed to fetch data from server.")
            }
        }
    }
}

//
//  API.swift
//  CarFax
//
//  Created by Harsh_Dev on 2020-09-17.
//  Copyright © 2020 Pineapple Inc. All rights reserved.
//

import Foundation
import UIKit
import Reachability

//MARK: API Request related enum and structs

//HTTP Request types
enum RequestType:String{
    case get = "GET"
    case post = "POST"
}

//API Request parameters
struct APIRequestProperties{
    var url : URL
    var param : [String:Any]?
    var requestType : RequestType
}

//API Response
struct Response {
    var responseData: [String: Any]?
    var httpStatusCode: Int = 0
    var error : Error?
}

//MARK: APIs link

enum ApiLinks : String {
    case listCars = "https://carfax-for-consumers.firebaseio.com/assignment.json"
    
    var urlLink : URL {
        switch self {
        case .listCars:
            return URL.init(string: "https://carfax-for-consumers.firebaseio.com/assignment.json") ?? URL(fileURLWithPath: "")
        }
    }
}

//MARK: APIs list

//List Of all API in project and get all parameters using enum
enum ApiList{
    case listCars
    
    func returnAPIRequestProperties()->APIRequestProperties{
        switch self {
        case .listCars:
            return APIRequestProperties.init(url: ApiLinks.listCars.urlLink, param: nil , requestType: .get)
        }
    }
}


class APIManager{
    
    public static var shared = APIManager()
    
    let reachability = try! Reachability()
    
    //MARK: call API
    func processFromURL(apiRequestParam : APIRequestProperties , apiResponse : @escaping ((_ apiResponse : Response)->Void)){
        
        guard reachability.connection != .unavailable else {
            apiResponse(Response.init(responseData: nil, httpStatusCode: 500, error: nil))
            return
        }
        
        var request = URLRequest(url: apiRequestParam.url)
        request.httpMethod = apiRequestParam.requestType.rawValue
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard (data != nil) && error == nil else{
                    apiResponse(Response.init(responseData: [:], httpStatusCode: ((response as? HTTPURLResponse)?.statusCode) ?? 500, error: error))
                    return
                }
                
                guard let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] else {
                    apiResponse(Response.init(responseData: [:], httpStatusCode: ((response as? HTTPURLResponse)?.statusCode) ?? 500, error: error))
                    return
                }
                apiResponse(Response.init(responseData: json, httpStatusCode: ((response as? HTTPURLResponse)?.statusCode) ?? 500, error: error))
            } catch  {
                apiResponse(Response.init(responseData: [:], httpStatusCode: ((response as? HTTPURLResponse)?.statusCode) ?? 500, error: error))
            }
        })
        task.resume()
    }

}


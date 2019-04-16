//
//  AlamofireServices.swift
//  QS TAXIAPP
//
//  Created by shailesh on 02/11/18.
//  Copyright © 2018 Shailesh. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class AlamofireServices: NSObject {
    var data:[String:Any] = [:]
    
    //MARK: GET REQUEST WITHOUT PARAMATER
    
    class func requesGETURL(strURL:String, headers : [String : String]?, succses: @escaping(Dictionary<String, Any>) -> Void, failure: @escaping(Error)-> Void) {
        Alamofire.request(strURL, headers: headers).responseJSON { (responce) in
            print("Response ==>>\(responce)")
            if responce.result.isSuccess {
                let dictonary = responce.result.value as! [String:Any]
                succses(dictonary)
            }
            if(responce.result.isFailure) {
                let error:Error = responce.result.error!
                failure(error)
            }
        }
    }
    
    //MARK: POST REQUEST WITH PARAMATER
    class func requestPOSTURL(_ strUrl:String, param : [String : AnyObject]?, headers:[String : String]?, success:@escaping (Dictionary<String, Any>) -> Void, failure: @escaping (Error) -> Void) {
        
        Alamofire.request(strUrl, method: .post, parameters: param, encoding: URLEncoding.httpBody, headers: headers).responseJSON { (respone) in
            print("Response ==>>\(respone)")
            if respone.result.isSuccess {
                let data = respone.result.value as! [String:Any]
                success(data)
            }
            if respone.result.isFailure {
                let error = respone.result.error!
                failure(error)
            }
        }
    }
    
    //MARK: PUT REQUEST WITH PARAMATER
    class func requestPUTURL(_ strUrl:String,param: [String:AnyObject]?,headers:[String:String]?,success: @escaping (Dictionary<String, Any>) -> Void, failure: @escaping (Error) -> Void) {
        Alamofire.request(strUrl, method: .put, parameters: param, encoding: URLEncoding.httpBody, headers: headers).responseJSON{(respone) in
            print("Response ==>>\(respone)")
            if respone.result.isSuccess {
                let data = respone.result.value as! [String:Any]
                success(data)
            }
            if respone.result.isFailure {
                let error = respone.result.error!
                failure(error)
            }
        }
    }
    
    //MARK: GET REQUEST WITH PARAMATER
    class func requestGET(_ strUrl:String,parm:[String:AnyObject]?,header:[String: String]?, succses: @escaping(Dictionary<String, Any>) -> Void, failure: @escaping(Error)-> Void){
        Alamofire.request(strUrl, method: .get, parameters: parm, encoding: JSONEncoding.default, headers: header).responseJSON { (respone) in
            print("Response ==>>\(respone)")
            if respone.result.isSuccess {
                let data = respone.result.value as! [String:Any]
                succses(data)
            }
            if respone.result.isFailure {
                let error = respone.result.error!
                failure(error)
            }
        }
    }
    //MARK: DELETE REQUEST
    class func deleteRequest(_ strUrl:URL,paramater:[String:AnyObject], header:[String:String]?,succses: @escaping(Dictionary<String, Any>) -> Void, failure: @escaping(Error)-> Void){
        Alamofire.request(strUrl, method: .delete, parameters: paramater, encoding: JSONEncoding.default, headers: header).responseJSON { (respone) in
            print("Response ==>>\(respone)")
            if respone.result.isSuccess {
                let data = respone.result.value as! [String:Any]
                succses(data)
            }
            if respone.result.isFailure {
                let error = respone.result.error!
                failure(error)
            }
        }
    }
    //MARK: GET REQUEST WITH PARAMATER FOR CODABLE
    class func requestGETNewPara(_ strUrl:String,parm:[String:AnyObject]?,header:[String: String]?, succses: @escaping(Data?) -> Void, failure: @escaping(Error)-> Void){
        Alamofire.request(strUrl, method: .get, parameters: parm, headers: header).responseJSON { (respone) in
            print("Response ==>>\(respone)")
            if respone.result.isSuccess {
                let data = respone.data
                succses(data)
            }
            if respone.result.isFailure {
                let error = respone.result.error!
                failure(error)
            }
        }
    }
}


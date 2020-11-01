//
//  NetworkingClient.swift
//  Alamofire5_Get
//
//  Created by Nikhil Balne on 31/10/20.
//

import Foundation
import Alamofire

class NetworkingClient: NSObject {
    
    static let networkingClient = NetworkingClient()
    
    func makeGetServiceCall(url:String, controller:UIViewController, completion: @escaping (_ result: AFDataResponse<Any>) -> Void) {
        
        print("URL:\(url)")
        
        AF.request(url, method: .get, encoding: JSONEncoding.default).responseJSON{
                response in
                    completion(response)
            }
    }
    
    func makePostServiceCall<Q:Encodable>(url:String, controller:UIViewController, parameters:Q, completion: @escaping (_ result: AFDataResponse<Any>) -> Void) {
        
        
        print("URL:\(url)")
        print("Parameters:\(parameters)")
        
        let headers : HTTPHeaders = ["Content-Type": "application/json"]
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers:headers
            ).responseJSON{
                response in
                    completion(response)
            }
    
    }
    
    
}

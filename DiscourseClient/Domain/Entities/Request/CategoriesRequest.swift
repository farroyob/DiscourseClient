//
//  CategoriesRequest.swift
//  DiscourseClient
//
//  Created by Freddy A. on 8/1/21.
//

import Foundation

import UIKit

class CategoriesRequest: APIRequest {
    typealias Response = CategoriesResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/categories.json"
    }
    
    var parameters: [String : String] {
        return ["" : ""]
    }
    
    var body: [String : Any]{
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
    
}

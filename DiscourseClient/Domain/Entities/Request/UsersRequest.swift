//
//  UsersRequest.swift
//  DiscourseClient
//
//  Created by Freddy A. on 7/28/21.
//

import UIKit

class UsersRequest: APIRequest {
    typealias Response = UsersResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/directory_items.json"
    }
    
    var parameters: [String : String] {
        return ["period" : "all"]
    }
    
    var body: [String : Any]{
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
    
}

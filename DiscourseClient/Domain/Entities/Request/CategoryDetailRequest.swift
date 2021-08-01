//
//  CategoriesDetailRequest.swift
//  DiscourseClient
//
//  Created by Freddy A. on 8/1/21.
//

import UIKit

class CategoryDetailRequest: APIRequest {
    typealias Response = CategoryDetailResponse
    
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/c/\(id)/show.json"
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

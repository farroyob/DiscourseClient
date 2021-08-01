//
//  UserDetailResponse.swift
//  DiscourseClient
//
//  Created by Freddy A. on 8/1/21.
//

import UIKit

struct UserDetailResponse: Codable {
    let user: UserDetail
}

struct UserDetail: Codable {
    let id: Int
    let username: String
    let name: String
    let canEditName: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case name
        case canEditName = "can_edit_name"
    }
}

 

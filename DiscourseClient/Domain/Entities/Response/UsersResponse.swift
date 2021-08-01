//
//  UsersResponse.swift
//  DiscourseClient
//
//  Created by Freddy A. on 7/28/21.
//

import UIKit

struct UsersResponse: Codable {
    let directoryItems: [DirectoryItem]
    
    enum CodingKeys: String, CodingKey {
        case directoryItems = "directory_items"
    }
    
}

struct DirectoryItem: Codable {
    let user: User
}

struct User: Codable {
    let id: Int
    let username: String
    let name: String?
    let avatarTemplate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case name
        case avatarTemplate = "avatar_template"
    }
}

//
//  CategoriesDetailResponse.swift
//  DiscourseClient
//
//  Created by Freddy A. on 8/1/21.
//

import UIKit

struct CategoryDetailResponse: Codable {
    let category: CategoryDetail
}

struct CategoryDetail: Codable {
    let id: Int
    let name: String
    let color: String
}

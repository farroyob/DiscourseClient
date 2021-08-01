//
//  CategoriesResponse.swift
//  DiscourseClient
//
//  Created by Freddy A. on 8/1/21.
//

import UIKit

// MARK: - Welcome
struct CategoriesResponse: Codable {
    let categoryList: CategoryList
    
    enum CodingKeys: String, CodingKey {
        case categoryList = "category_list"
    }
}

// MARK: - CategoryList
struct CategoryList: Codable {
    let categories: [Category]
    
    enum CodingKeys: String, CodingKey {
        case categories
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name, color, textColor, slug: String
    let topicCount, postCount, position: Int
    let categoryDescription, descriptionText: String
    let topicURL: String?
    let readRestricted: Bool
    let hasChildren: Bool
    let showSubcategoryList: Bool
    let numFeaturedTopics: Int
    let subcategoryListStyle, defaultTopPeriod: String
    let minimumRequiredTags: Int
    let navigateToFirstPostAfterRead: Bool
    let topicsDay, topicsWeek, topicsMonth, topicsYear: Int
    let topicsAllTime: Int
    let descriptionExcerpt: String
    let isUncategorized: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, name, color
        case textColor = "text_color"
        case slug
        case topicCount = "topic_count"
        case postCount = "post_count"
        case position
        case categoryDescription = "description"
        case descriptionText = "description_text"
        case topicURL = "topic_url"
        case readRestricted = "read_restricted"
        case hasChildren = "has_children"
        case showSubcategoryList = "show_subcategory_list"
        case numFeaturedTopics = "num_featured_topics"
        case subcategoryListStyle = "subcategory_list_style"
        case defaultTopPeriod = "default_top_period"
        case minimumRequiredTags = "minimum_required_tags"
        case navigateToFirstPostAfterRead = "navigate_to_first_post_after_read"
        case topicsDay = "topics_day"
        case topicsWeek = "topics_week"
        case topicsMonth = "topics_month"
        case topicsYear = "topics_year"
        case topicsAllTime = "topics_all_time"
        case descriptionExcerpt = "description_excerpt"
        case isUncategorized = "is_uncategorized"
    }
}

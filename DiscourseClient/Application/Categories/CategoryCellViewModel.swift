//
//  CategoryCellViewModel.swift
//  DiscourseClient
//
//  Created by Freddy A. on 8/1/21.
//

import UIKit

protocol CategoryCellViewProtocol: AnyObject {
    
}

class CategoryCellViewModel {
    weak var view: CategoryCellViewProtocol?
    let category: Category
        
    init(category: Category) {
        self.category = category
    }
}

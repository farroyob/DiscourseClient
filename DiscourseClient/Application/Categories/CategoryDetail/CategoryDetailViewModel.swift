//
//  CategoryDetailViewModel.swift
//  DiscourseClient
//
//  Created by Freddy A. on 8/1/21.
//

import UIKit

protocol CategoryDetailViewProtocol: AnyObject {
    func onGetCategorySuccess(CategoryDetail: CategoryDetailViewStruct)
    func onGetCategoryFail()
}

struct CategoryDetailViewStruct {
    var CategoryId: String?
    var nameLabel: String?
    var colorCategory: String?
}

class CategoryDetailViewModel: ViewModel {
    typealias View = CategoryDetailViewProtocol
    typealias Coordinator = categoryDetailCoordinator
    typealias UseCases = CategoryDetailUseCases
    
    weak var view: CategoryDetailViewProtocol?
    var coordinator: categoryDetailCoordinator?
    var useCases: CategoryDetailUseCases
    
    let categoryId: String
    
    init(categoryId: String, CategoryDetailUseCases: CategoryDetailUseCases) {
        self.useCases = CategoryDetailUseCases
        self.categoryId = categoryId
    }
    
    func viewDidLoad() {
        useCases.fetchCategory(id: categoryId) {[weak self] result in
            switch result {
            case .success(let response):
                guard let response = response else { return }
                
                let CategoryDetailViewStruct = CategoryDetailViewStruct(CategoryId: "\(response.category.id)", nameLabel: response.category.name, colorCategory: response.category.color)
               
                
                self?.view?.onGetCategorySuccess(CategoryDetail: CategoryDetailViewStruct)
                
            case .failure:
                self?.view?.onGetCategoryFail()
            }
        }
    }
}

//
//  CategoryDetailCoordinator.swift
//  DiscourseClient
//
//  Created by Freddy A. on 8/1/21.
//

import UIKit

class categoryDetailCoordinator: Coordinator {
    var navigator: UINavigationController
    
    let id: String
    let useCases: CategoryDetailUseCases
    
    
    init(navigator: UINavigationController, id: String, useCases: CategoryDetailUseCases) {
        self.navigator = navigator
        self.id = id
        self.useCases = useCases
    }
    
    func start() {
        let categoryDetailViewModel = CategoryDetailViewModel(categoryId: self.id, CategoryDetailUseCases: self.useCases)
        let categoryDetailViewController = CategoryDetailViewController(viewModel: categoryDetailViewModel)
        categoryDetailViewModel.view = categoryDetailViewController
        categoryDetailViewModel.coordinator = self
        categoryDetailViewController.title = id
        navigator.pushViewController(categoryDetailViewController, animated: true)
    }
    
    
}

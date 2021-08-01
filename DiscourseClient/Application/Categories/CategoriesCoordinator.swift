//
//  CategoriesCoordinator.swift
//  DiscourseClient
//
//  Created by Freddy A. on 8/1/21.
//

import UIKit

class CategoriesCoordinator: Coordinator {
    var navigator: UINavigationController
    let categoriesUseCases: CategoriesUseCases
    
    let remoteDataManager = RemoteDataManager()
    
    lazy var categoryDetailUseCases: CategoryDetailUseCases = DataManager(remoteDataManager: remoteDataManager)
    
    init(navigator: UINavigationController, categoriesUseCases: CategoriesUseCases) {
        self.navigator = navigator
        self.categoriesUseCases = categoriesUseCases
    }
    
    func start() {
        let categoriesViewModel = CategoriesViewModel(useCases: self.categoriesUseCases)
        let categoriesViewController = CategoriesViewController(viewModel: categoriesViewModel)
        
        categoriesViewController.title = "Categories"
        categoriesViewModel.view = categoriesViewController
        categoriesViewModel.coordinator = self
        navigator.pushViewController(categoriesViewController, animated: false)
    }
    
    func didSelect(id: String) {
        let categoriesDetailCoordinator = categoryDetailCoordinator(navigator: navigator, id: id, useCases: categoryDetailUseCases)
        categoriesDetailCoordinator.start()
    }
}

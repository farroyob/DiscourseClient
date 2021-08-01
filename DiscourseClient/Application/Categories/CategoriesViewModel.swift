//
//  CategoriesViewModel.swift
//  DiscourseClient
//
//  Created by Freddy A. on 8/1/21.
//

import UIKit

protocol CategoriesViewProtocol: AnyObject {
    func CategoriesFetched()
    func errorFetchingCategories()
}

class CategoriesViewModel: ViewModel {
    typealias View = CategoriesViewProtocol
    typealias Coordinator = CategoriesCoordinator
    typealias UseCases = CategoriesUseCases
    
    weak var view: View?
    var coordinator: Coordinator?
    var useCases: UseCases
    
    init(useCases: CategoriesUseCases) {
        self.useCases = useCases
    }
    
    var CategoryCellViewModels:  [CategoryCellViewModel] = []
    
    func viewDidLoad(){
        useCases.fetchAllCategories { [weak self] result in
            switch result {
            case .success(let response):
                guard let response = response  else {
                    self?.view?.errorFetchingCategories(); return
                }
                
                self?.CategoryCellViewModels = response.categoryList.categories.map{ CategoryCellViewModel(category: $0)}
                self?.view?.CategoriesFetched()
                
                
            case .failure:
                self?.view?.errorFetchingCategories()
            }
            
        }
    }
    
    
    func numberOfRows(in section: Int) -> Int {
        return CategoryCellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CategoryCellViewModel? {
        guard indexPath.row < CategoryCellViewModels.count else { return nil }
        
        return CategoryCellViewModels[indexPath.row]
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func didSelectRow(at indexPath: IndexPath){
        coordinator?.didSelect(id:  "\(CategoryCellViewModels[indexPath.row].category.id)")
    }
    
}

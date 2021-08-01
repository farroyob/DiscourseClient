//
//  UserViewModel.swift
//  DiscourseClient
//
//  Created by Freddy A. on 7/24/21.
//

import UIKit

protocol UsersViewProtocol: AnyObject {
    func usersFetched()
    func errorFetchingUsers()
}

class UsersViewModel: ViewModel {
    typealias View = UsersViewProtocol
    typealias Coordinator = UsersCoordinator
    typealias UseCases = UsersUseCases
    
    weak var view: View?
    var coordinator: Coordinator?
    var useCases: UseCases
    
    init(useCases: UsersUseCases) {
        self.useCases = useCases
    }
    
    var UserCellViewModels:  [UserCellViewModel] = []

    func viewDidLoad(){
        useCases.fetchAllUsers { [weak self] result in
            switch result {
            case .success(let response):
                guard let response = response  else {
                    self?.view?.errorFetchingUsers(); return
                }
                
                self?.UserCellViewModels = response.directoryItems.map{ UserCellViewModel(user: $0.user)}
                self?.view?.usersFetched()
                
                
            case .failure:
                self?.view?.errorFetchingUsers()
            }
            
        }
    }
    
    
    func numberOfRows(in section: Int) -> Int {
        return UserCellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> UserCellViewModel? {
        guard indexPath.row < UserCellViewModels.count else { return nil }
        
        return UserCellViewModels[indexPath.row]
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func didSelectRow(at indexPath: IndexPath){
        coordinator?.didSelect(username:  UserCellViewModels[indexPath.row].user.username)
    }
    
}

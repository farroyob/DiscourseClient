//
//  UserDetailViewModel.swift
//  DiscourseClient
//
//  Created by Freddy A. on 7/31/21.
//

import UIKit

protocol UserDetailViewProtocol: AnyObject {
    func onGetUserSuccess(userDetail: UserDetailViewStruct)
    func onGetUserFail()
}

struct UserDetailViewStruct {
    var userId: String?
    var nameLabel: String?
    var canEditName: Bool
}

class UserDetailViewModel: ViewModel {
    typealias View = UserDetailViewProtocol
    typealias Coordinator = userDetailCoordinator
    typealias UseCases = UserDetailUseCases
    
    weak var view: UserDetailViewProtocol?
    var coordinator: userDetailCoordinator?
    var useCases: UserDetailUseCases
    
    let username: String
    
    init(username: String, userDetailUseCases: UserDetailUseCases) {
        self.useCases = userDetailUseCases
        self.username = username
    }
    
    func viewDidLoad() {
        useCases.fetchUser(username: username) {[weak self] result in
            switch result {
            case .success(let response):
                guard let response = response else { return }
                
                let userDetailViewStruct = UserDetailViewStruct(userId: "\(response.user.id)", nameLabel: response.user.name, canEditName: response.user.canEditName)
                
                self?.view?.onGetUserSuccess(userDetail: userDetailViewStruct)
                
            case .failure:
                self?.view?.onGetUserFail()
            }
        }
    }
}

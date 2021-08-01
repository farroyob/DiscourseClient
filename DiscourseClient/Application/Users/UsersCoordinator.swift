//
//  UsersCoordinator.swift
//  DiscourseClient
//
//  Created by Freddy A. on 7/24/21.
//

import UIKit

class UsersCoordinator: Coordinator {
    var navigator: UINavigationController
    let userUseCases: UsersUseCases
    
    let remoteDataManager = RemoteDataManager()
    
    lazy var userDetailUseCases: UserDetailUseCases = DataManager(remoteDataManager: remoteDataManager)
    
    init(navigator: UINavigationController, userUseCases: UsersUseCases) {
        self.navigator = navigator
        self.userUseCases = userUseCases
    }
    
    func start() {
        let userViewModel = UsersViewModel(useCases: self.userUseCases)
        let userViewController = UsersViewController(viewModel: userViewModel)
        
        userViewController.title = "Users"
        userViewModel.view = userViewController
        userViewModel.coordinator = self
        navigator.pushViewController(userViewController, animated: false)
    }
    
    func didSelect(username: String) {
        let userDetailCoordinator = userDetailCoordinator(navigator: navigator, username: username, useCases: userDetailUseCases)
        userDetailCoordinator.start()
    }
}

//
//  UserDetailCoordinator.swift
//  DiscourseClient
//
//  Created by Freddy A. on 7/31/21.
//

import UIKit

class userDetailCoordinator: Coordinator {
    var navigator: UINavigationController
    
    let username: String
    let useCases: UserDetailUseCases
    
    
    init(navigator: UINavigationController, username: String, useCases: UserDetailUseCases) {
        self.navigator = navigator
        self.username = username
        self.useCases = useCases
    }
    
    func start() {
        let userDetailViewModel = UserDetailViewModel(username: username, userDetailUseCases: useCases)
        let userDetailViewController = UserDetailViewController(viewModel: userDetailViewModel)
        userDetailViewModel.view = userDetailViewController
        userDetailViewModel.coordinator = self
        userDetailViewController.title = username
        navigator.pushViewController(userDetailViewController, animated: true)
        
    }
    
    
}

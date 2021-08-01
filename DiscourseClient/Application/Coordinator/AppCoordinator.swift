//
//  AppCoordinator.swift
//  DiscourseClient
//
//  Created by Freddy A. on 7/24/21.
//

import UIKit

protocol Coordinator {
    var navigator: UINavigationController{get}
    
    func start()
    func finish()
}

extension Coordinator{
    func finish(){
        navigator.dismiss(animated: true, completion: nil)
    }
    
}

class AppCoordinator: Coordinator{
    var navigator: UINavigationController = UINavigationController()
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    var dataManager = DataManager(remoteDataManager: RemoteDataManager())
    
    func start() {
        let tabBarController = UITabBarController()
        
        tabBarController.tabBar.tintColor = .black
        
        //Inicializar viewController del tab bar
        
        let usersNavigator = UINavigationController()
        let usersCoordinator = UsersCoordinator(navigator: usersNavigator, userUseCases: dataManager)
        
        usersCoordinator.start()
        
        let categoriesNavigator = UINavigationController()
        let categoriesCoordinator = CategoriesCoordinator(navigator: categoriesNavigator, categoriesUseCases: dataManager)
        
        categoriesCoordinator.start()
        
        //ViewControllers del TabBar
        tabBarController.viewControllers = [usersNavigator, categoriesNavigator]
        tabBarController.tabBar.items?.first?.image = UIImage(systemName: "tag")
        tabBarController.tabBar.items?[1].image = UIImage(systemName: "tray")
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    
    
    
    
}

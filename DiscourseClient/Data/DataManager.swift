//
//  DataManager.swift
//  DiscourseClient
//
//  Created by Freddy A. on 7/24/21.
//

import UIKit

class DataManager {
    let remoteDataManager: RemoteDataManager
    
    init(remoteDataManager: RemoteDataManager){
        self.remoteDataManager = remoteDataManager
    }
}

extension DataManager: UsersUseCases {
    func fetchAllUsers(completion: @escaping (Result<UsersResponse?, Error>) -> ()) {
        remoteDataManager.fetchAllUsers(completion: completion)
    }
}

extension DataManager: CategoriesUseCases {
    func fetchAllCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ()) {
        remoteDataManager.fetchAllCategories(completion: completion)
    }
}

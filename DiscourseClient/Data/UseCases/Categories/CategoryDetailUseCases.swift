//
//  CategoriesDetailUseCases.swift
//  DiscourseClient
//
//  Created by Freddy A. on 8/1/21.
//

import UIKit

protocol CategoryDetailUseCases {
    func fetchCategory(id: String, completion: @escaping (Result<CategoryDetailResponse?, Error>) -> ())
}

extension DataManager: CategoryDetailUseCases {
    func fetchCategory(id: String, completion: @escaping (Result<CategoryDetailResponse?, Error>) -> ()) {
        remoteDataManager.fetchCategory(id: id, completion: completion)
    }
}

extension RemoteDataManager: CategoryDetailUseCases {
    func fetchCategory(id: String, completion: @escaping (Result<CategoryDetailResponse?, Error>) -> ()) {
        let request = CategoryDetailRequest(id: id)
        
        session.request(request: request) { result in
            completion(result)
        }
    }
}

//
//  CategoriesUseCases.swift
//  DiscourseClient
//
//  Created by Freddy A. on 8/1/21.
//

import UIKit

protocol CategoriesUseCases {
    func fetchAllCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ())
}

extension RemoteDataManager: CategoriesUseCases {
    func fetchAllCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ()) {
        let request = CategoriesRequest()
        
        session.request(request: request) { result in
            completion(result)
        }
    }
}

//
//  UsersUseCases.swift
//  DiscourseClient
//
//  Created by Freddy A. on 7/24/21.
//

import UIKit

protocol UsersUseCases {
    func fetchAllUsers(completion: @escaping (Result<UsersResponse?, Error>) -> ())
}

extension RemoteDataManager: UsersUseCases {
    func fetchAllUsers(completion: @escaping (Result<UsersResponse?, Error>) -> ()) {
        let request = UsersRequest()
        
        session.request(request: request) { result in
            completion(result)
        }
    }
}

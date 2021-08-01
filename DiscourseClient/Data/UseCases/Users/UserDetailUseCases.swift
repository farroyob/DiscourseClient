//
//  UserDetailUseCases.swift
//  DiscourseClient
//
//  Created by Freddy A. on 7/31/21.
//

import UIKit

protocol UserDetailUseCases {
    func fetchUser(username: String, completion: @escaping (Result<UserDetailResponse?, Error>) -> ()) 
}

extension DataManager: UserDetailUseCases {
    func fetchUser(username: String, completion: @escaping (Result<UserDetailResponse?, Error>) -> ()) {
        remoteDataManager.fetchUser(username: username, completion: completion)
    }
}

extension RemoteDataManager: UserDetailUseCases {
    func fetchUser(username: String, completion: @escaping (Result<UserDetailResponse?, Error>) -> ()) {
        let request = UserDetailRequest(username: username)
        
        session.request(request: request) { result in
            completion(result)
        }
    }
    
    
}

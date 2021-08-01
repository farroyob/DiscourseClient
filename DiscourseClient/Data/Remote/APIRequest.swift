//
//  APIRequest.swift
//  DiscourseClient
//
//  Created by Freddy A. on 7/24/21.
//

import UIKit

//let apiURL = "https://mdiscourse.keepcoding.io"

enum Method: String {
    case GET
    case POST
    case PUT
    case DELETE
}

protocol APIRequest {
    associatedtype Response: Codable
    var method:  Method { get }
    var path: String { get }
    var parameters: [String: String] { get }
    var body: [String:Any] { get }
    var headers: [String:String] { get }
}

extension APIRequest {
    var apiURL: String {
        return "https://mdiscourse.keepcoding.io"
    }
    
    var baseURL: URL {
        guard let baseURL = URL(string: apiURL) else{
            fatalError("URL not valid")
        }
        
        return baseURL
    }
    
    func requestWithBaseUrl() -> URLRequest {
        //Definir cual va a ser la URL
        let url = baseURL.appendingPathComponent(path)
        
        //aqui tendriamos www.google.com/search
        
        //si tiene parametros
        
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            fatalError("Not able create componets")
        }
        
        if (!parameters.isEmpty){
            components.queryItems = parameters.map{key, value in URLQueryItem(name: key, value: value)}
        }
        
        guard let finalUrl = components.url else {
            fatalError("Unable to get final URL")
        }
        
        //aqui tendriamos www.google.com/search?q=Hola
        
        var request = URLRequest(url: finalUrl)
        
        request.httpMethod = method.rawValue
        
        if !body.isEmpty{
            let jsonData = try? JSONSerialization.data(withJSONObject: body)
            request.httpBody = jsonData
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.addValue("699667f923e65fac39b632b0d9b2db0d9ee40f9da15480ad5a4bcb3c1b095b7a", forHTTPHeaderField: "Api-Key")
        
        request.addValue("farroyob", forHTTPHeaderField: "Api-Username")
        return request
        
    }
    
}

//
//  Endpoinr.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 13.01.2025.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
}

enum Endpoint {
    case getFollowers(username: String, page: Int)
    case getUserDetail(username: String)
}

protocol EndpointProtocol {
    var baseUrl: String { get }
    var method: HTTPMethods { get }
    var genreUrl: String { get }
    
    func gfUrl() -> String
    func request() -> URLRequest
}

// genre url

extension Endpoint: EndpointProtocol {
    var baseUrl: String {
        return "https://api.github.com/users"
    }
        
    var method: HTTPMethods {
        switch self {
        case .getFollowers:
            return .get
        case .getUserDetail:
            return .get
        }
    }
    
    var genreUrl: String {
        switch self {
        case .getFollowers(let username, let page):
            return "/\(username)/followers?per_page=100&page=\(page)"
        case .getUserDetail(let username):
            return "/\(username)"
        }
    }
        
    func gfUrl() -> String {
        return "\(baseUrl)\(genreUrl)"
    }
    
    func request() -> URLRequest {
        guard let apiUrl = URLComponents(string: gfUrl()) else {
            fatalError("")
        }
        
        guard let url = apiUrl.url else {
            fatalError("")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}

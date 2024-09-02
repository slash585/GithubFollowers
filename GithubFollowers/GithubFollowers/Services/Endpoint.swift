//
//  Endpoint.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 2.09.2024.
//

import Foundation

protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethods { get }
    var header: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    
    func request() -> URLRequest
}

enum Endpoint {
    case getFollowers(username: String, perPage: Int, page: Int)
}

extension Endpoint: EndpointProtocol {
    var baseUrl: String {
        return "https://api.github.com"
    }
    
    var path: String {
        switch self {
        case .getFollowers(let username, _, _):
            return "/users/\(username)/followers"
        }
    }
    
    var method: HTTPMethods {
        return .get
    }
    
    var header: [String : String]? {
        return ["Accept": "application/vnd.github.v3+json"]
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getFollowers(_, let perPage, let page):
            return [
                URLQueryItem(name: "per_page", value: "\(perPage)"),
                URLQueryItem(name: "page", value: "\(page)")
            ]
        }
    }
    
    func request() -> URLRequest {
        var urlComponents = URLComponents(string: baseUrl + path)
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
            fatalError("URL ERROR")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let headers = header {
            headers.forEach { request.addValue($1, forHTTPHeaderField: $0) }
        }
        
        return request
    }
}

enum HTTPMethods: String {
    case get = "GET"
}

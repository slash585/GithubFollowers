//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 13.01.2025.
//

import Foundation

protocol NetworkManagerProtocol {
    func request<T>(_ endpoint: Endpoint, completion: @escaping ((Result<T, Error>) -> Void)) where T : Decodable
}

final class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    func request<T>(_ endpoint: Endpoint, completion: @escaping ((Result<T, Error>) -> Void)) where T : Decodable {
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
                    
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 299 else {
                return
            }
                        
            guard let data = data else {
                completion(.failure(URLError(.badURL)))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch let error {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

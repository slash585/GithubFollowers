//
//  NetworkManager.swift
//  Github Followers
//
//  Created by Mehmet Ali Özdemir on 22.07.2023.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseUrl = "https://api.github.com/"
    
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, complated: @escaping (Result<[Follower], GFError>) -> Void){
        let endpoint = baseUrl + "users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            complated(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                complated(.failure(.unableToComplate))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                complated(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                complated(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                complated(.success(followers))
            } catch {
                complated(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}

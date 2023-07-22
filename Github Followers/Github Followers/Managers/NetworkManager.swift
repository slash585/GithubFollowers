//
//  NetworkManager.swift
//  Github Followers
//
//  Created by Mehmet Ali Özdemir on 22.07.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let baseUrl = "https://api.github.com/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, complated: @escaping([Follower]?, ErrorMessage?) -> Void){
        let endpoint = baseUrl + "users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            complated(nil, .invalidUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                complated(nil, .unableToComplate)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                complated(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                complated(nil, .invalidData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                complated(followers, nil)
            } catch {
                complated(nil, .invalidData)
            }
        }
        
        task.resume()
    }
}

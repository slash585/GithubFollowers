//
//  Follower.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 15.01.2025.
//

import Foundation

struct Follower: Decodable, Hashable {
    var login: String
    var avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url" // Use the exact property name
        case login
    }
}

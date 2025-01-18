//
//  User.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 15.01.2025.
//

import Foundation

struct User: Decodable {
    let login: String
    let avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let following: Int
    let followers: Int
    let createdAt: String
}

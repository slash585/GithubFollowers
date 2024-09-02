//
//  SearchContracts.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 2.09.2024.
//

import Foundation

protocol SearchViewModelProtocol {
    var delegate: SearchViewModelDelegate? { get set }
    func fetchUserFollowers(username: String)
}

enum SearchRoute {
    case followerList(username: String)
}

protocol SearchViewModelDelegate: AnyObject {
    func navigate(to route: SearchRoute)
}

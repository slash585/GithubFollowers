//
//  FollowerListContructor.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 2.09.2024.
//

import Foundation

protocol FollowerListViewModelProtocol {
    var delegate: FollowerListViewModelDelegate? { get set }
    var username: String? { get set }
    var page: Int { get set }
    
    func viewDidLoad()
    func increasePage()
}

enum FollowerListViewModelOutput {
    case setLoading(Bool)
    case showFollowerList([Follower])
    case updateFollowerList([Follower])
}

protocol FollowerListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: FollowerListViewModelOutput)
}

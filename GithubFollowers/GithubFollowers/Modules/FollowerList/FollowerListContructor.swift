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
    
    func viewDidLoad()
}

enum FollowerListViewModelOutput {
    case setLoading(Bool)
    case showMovieList([Follower])
}

protocol FollowerListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: FollowerListViewModelOutput)
}

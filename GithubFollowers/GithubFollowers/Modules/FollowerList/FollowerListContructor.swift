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
}
protocol FollowerListViewModelDelegate: AnyObject {}

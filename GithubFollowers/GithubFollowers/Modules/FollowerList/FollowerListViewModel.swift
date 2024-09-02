//
//  FollowerListViewModel.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 2.09.2024.
//

import Foundation

final class FollowerListViewModel: FollowerListViewModelProtocol {
    weak var delegate: FollowerListViewModelDelegate?
    
    var username: String?
    
    private let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol, username: String) {
        self.service = NetworkService.shared
        self.username = username
    }
}

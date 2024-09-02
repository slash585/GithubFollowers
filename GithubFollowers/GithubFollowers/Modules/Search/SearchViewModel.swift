//
//  SearchViewModel.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 2.09.2024.
//

import Foundation

final class SearchViewModel: SearchViewModelProtocol {
    var delegate: SearchViewModelDelegate?
        
    func fetchUserFollowers(username: String) {
        delegate?.navigate(to: .followerList(username: username))
    }
}

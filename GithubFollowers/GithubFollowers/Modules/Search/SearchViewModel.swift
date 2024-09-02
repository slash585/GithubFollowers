//
//  SearchViewModel.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 2.09.2024.
//

import Foundation

final class SearchViewModel: SearchViewModelProtocol {
    var delegate: SearchViewModelDelegate?
    
    private let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = NetworkService.shared
    }
    
    func fetchUserFollowers(username: String) {
        
    }
    
    
}

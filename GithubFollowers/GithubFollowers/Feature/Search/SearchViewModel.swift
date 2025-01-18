//
//  SearchViewModel.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 5.01.2025.
//

import Foundation

protocol SearchViewModelProtocol {
    func setUsername(for username: String)
}

final class SearchViewModel: SearchViewModelProtocol {
    private weak var view: SearchViewControllerProtocol?
            
    init(view: SearchViewControllerProtocol?) {
        self.view = view
    }
    
    func setUsername(for username: String) {
        view?.navigateToFollowerListVC(username: username)
    }
}


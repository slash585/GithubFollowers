//
//  SearchBuilder.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 5.01.2025.
//

import Foundation

final class SearchBuilder {
    static func make() -> SearchViewController {
        let vc = SearchViewController()
        let service = NetworkManager.shared
        let viewModel: SearchViewModelProtocol = SearchViewModel(view: vc, service: service)
        vc.viewModel = viewModel
        vc.title = "Search"
        vc.view.backgroundColor = .white
        return vc
    }
}

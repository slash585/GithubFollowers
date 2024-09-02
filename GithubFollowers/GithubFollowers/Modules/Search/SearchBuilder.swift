//
//  SearchBuilder.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 2.09.2024.
//

import UIKit

final class SearchBuilder {
    static func make() -> SearchViewController {
        let viewController = SearchViewController()
        let service = NetworkService()
        viewController.viewModel = SearchViewModel(service: service)
        return viewController
    }
}

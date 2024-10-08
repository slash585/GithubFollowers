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
        viewController.view.backgroundColor = .systemBackground
        viewController.viewModel = SearchViewModel()
        return viewController
    }
}

//
//  FollowerListBuilder.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 2.09.2024.
//

import Foundation

final class FollowerListBuilder {
    static func make(username: String) -> FollowerListViewController {
        let viewModel = FollowerListViewModel(service: NetworkService(), username: username)
        let viewController = FollowerListViewController(viewModel: viewModel)
        viewController.title = username
        viewController.view.backgroundColor = .systemBackground
        return viewController
    }
}

//
//  FollowerListBuilder.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 18.01.2025.
//

import Foundation

final class FollowerListBuilder {
    static func make(username: String) -> FollowerListViewController {
        let viewController = FollowerListViewController()
        viewController.title = username
        viewController.view.backgroundColor = .white
        return viewController
    }
}

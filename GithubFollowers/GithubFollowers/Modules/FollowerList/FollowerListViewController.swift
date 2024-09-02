//
//  FollowerListViewController.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 2.09.2024.
//

import UIKit

final class FollowerListViewController: UIViewController {
    
    var viewModel: FollowerListViewModelProtocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(viewModel.username)
    }
    
    init(viewModel: FollowerListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FollowerListViewController: FollowerListViewModelDelegate {
    
}

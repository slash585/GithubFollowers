//
//  ViewController.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 2.09.2024.
//

import UIKit

final class SearchViewController: UIViewController {
    
    var viewModel: SearchViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func navigate(to route: SearchRoute) {
        
    }
}


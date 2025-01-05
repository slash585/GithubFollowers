//
//  ViewController.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 5.01.2025.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject { }

final class SearchViewController: UIViewController {
    
    var viewModel: SearchViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
    }
}

extension SearchViewController: SearchViewControllerProtocol {}


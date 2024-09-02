//
//  ViewController.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 2.09.2024.
//

import UIKit
import SnapKit

final class SearchViewController: UIViewController {
    
    var viewModel: SearchViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.textColor = .label
        textField.tintColor = .label
        textField.textAlignment = .center
        textField.font = UIFont.preferredFont(forTextStyle: .title2)
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 12
        
        textField.backgroundColor = .tertiarySystemBackground
        textField.autocorrectionType = .no
        textField.returnKeyType = .go
        
        textField.placeholder = "Enter a username"
        return textField
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.backgroundColor = .systemGreen
        button.setTitle("Search", for: .normal)
        button.addTarget(self, action: #selector(handleTappedSearchButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

extension SearchViewController {
    private func configureUI() {
        makeSearchTextField()
        makeSearchButton()
    }
    
    private func makeSearchTextField() {
        view.addSubview(searchTextField)
        
        searchTextField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(350)
        }
    }
    
    private func makeSearchButton() {
        view.addSubview(searchButton)
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(14)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
    }
}

extension SearchViewController {
    @objc private func handleTappedSearchButton() {
        guard let username = searchTextField.text else { return }
        viewModel.fetchUserFollowers(username: username)
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func navigate(to route: SearchRoute) {
        switch route {
        case .followerList(let username):
            let viewController = FollowerListBuilder.make(username: username)
            show(viewController, sender: nil)
        }
    }
}


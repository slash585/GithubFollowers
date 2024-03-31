//
//  SearchViewController.swift
//  Github Followers
//
//  Created by Mehmet Ali Özdemir on 21.07.2023.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject {
    func pushVC(username: String)
    func showAlertView()
}

final class SearchViewController: UIViewController {
    
    private lazy var logoImageView = UIImageView()
    private lazy var usernameTextField = GFTextField()
    private lazy var callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    private lazy var viewModel = SearchViewModel(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func configure(){
        view.backgroundColor = .systemBackground

        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    private func configureLogoImageView(){
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
            
        ])
    }
    
    private func configureTextField(){
        view.addSubview(usernameTextField)
        
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureCallToActionButton(){
        view.addSubview(callToActionButton)
        
        callToActionButton.addTarget(self, action: #selector(handleTappedCallToActionButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    private func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
        
    @objc private func handleTappedCallToActionButton(){
        guard let username = usernameTextField.text else { return }
        viewModel.sendUsername(username: username)
    }
    
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Did tap return")
        return true
    }
}

extension SearchViewController: SearchViewControllerProtocol {
    func showAlertView() {
        presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for you", buttonTitle: "Ok")
    }
    
    func pushVC(username: String) {
        let followerListVC = FollowerViewController()
        followerListVC.username = username
        followerListVC.title = username
        navigationController?.pushViewController(followerListVC, animated: true)
    }
}

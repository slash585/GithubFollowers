//
//  ViewController.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 5.01.2025.
//

import UIKit
import SnapKit

protocol SearchViewControllerProtocol: AnyObject { }

final class SearchViewController: UIViewController {
    
    private let buttonTitle: String = "Get Followers"
    
    private lazy var gfButton: GFButton = GFButton(backgroundColor: .systemGreen, title: buttonTitle)
    private lazy var textField: GFTextField = GFTextField()
    
    
    private lazy var gfImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gh-logo")
        return imageView
    }()
    
    var viewModel: SearchViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

// MARK: - For UI
extension SearchViewController {
    private func configureUI() {
        makeGfImageView()
        makeTextField()
        makeButton()
        createDismissKeyboardTapGesture()
    }
    
    private func makeGfImageView() {
        view.addSubview(gfImageView)
        
        gfImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }
    }
    
    private func makeTextField() {
        view.addSubview(textField)
        
        textField.delegate = self
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(gfImageView.snp.bottom).offset(50)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.height.equalTo(50)
        }
    }
    
    private func makeButton() {
        view.addSubview(gfButton)
        
        gfButton.addTarget(self, action: #selector(handleTappedButton), for: .touchUpInside)
        
        gfButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.height.equalTo(50)
        }
    }
    
    private func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

// MARK: - for objc methods
extension SearchViewController {
    @objc private func handleTappedButton() {
        guard let username = textField.text else { return }
        print(username)
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Did tap return")
        return true
    }
}

extension SearchViewController: SearchViewControllerProtocol {}


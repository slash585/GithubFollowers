//
//  SearchViewModel.swift
//  Github Followers
//
//  Created by Mehmet Ali Özdemir on 31.03.2024.
//

import Foundation

protocol SearchViewModelProtocol {
    var username: String? { get set }
    func sendUsername(username: String)
}

final class SearchViewModel: SearchViewModelProtocol {    
    private weak var view: SearchViewControllerProtocol?
    
    var username: String?
    
    init(view: SearchViewControllerProtocol?) {
        self.view = view
    }
    
    func sendUsername(username: String) {
        guard !username.isEmpty else {
            view?.showAlertView()
            return
        }
        
        view?.pushVC(username: username)
    }
}

//
//  FollowerViewController.swift
//  Github Followers
//
//  Created by Mehmet Ali Özdemir on 22.07.2023.
//

import UIKit

final class FollowerViewController: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
            guard let followers = followers else {
                // Should be fixed title bug
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: errorMessage!, buttonTitle: "ok")
                return
            }
            
            print(followers.count)
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

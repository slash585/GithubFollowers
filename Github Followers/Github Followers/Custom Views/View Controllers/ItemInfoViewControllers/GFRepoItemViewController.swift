//
//  GFRepoItemViewController.swift
//  Github Followers
//
//  Created by Mehmet Ali Özdemir on 25.07.2023.
//

import UIKit

class GFRepoItemViewController: GFItemInfoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(infoItemType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(infoItemType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped(){
        delegate.didTapGithubProfile(for: user)
    }
    
}

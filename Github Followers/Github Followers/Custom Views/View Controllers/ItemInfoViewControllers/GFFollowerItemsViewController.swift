//
//  GFFollowerItemsViewController.swift
//  Github Followers
//
//  Created by Mehmet Ali Özdemir on 25.07.2023.
//

import UIKit

class GFFollowerItemsViewController: GFItemInfoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems(){
        itemInfoViewOne.set(infoItemType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(infoItemType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGray, title: "GitHub Profile")
    }
}

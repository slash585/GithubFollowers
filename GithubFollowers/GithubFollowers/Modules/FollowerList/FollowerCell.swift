//
//  FollowerCell.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 2.09.2024.
//

import UIKit
import Kingfisher
import SnapKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    private lazy var usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.textAlignment = .center
        usernameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        usernameLabel.textColor = .label
        usernameLabel.adjustsFontSizeToFitWidth = true
        usernameLabel.minimumScaleFactor = 0.9
        usernameLabel.lineBreakMode = .byTruncatingTail
        return usernameLabel
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.layer.cornerRadius = 10
        avatarImageView.clipsToBounds = true
        return avatarImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        downloadAvatarImage(from: follower.avatarUrl)
        makeUsernameLabel()
    }
}

extension FollowerCell {
    private func downloadAvatarImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        avatarImageView.kf.setImage(with: url)
        
        addSubview(avatarImageView)
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.left.equalTo(contentView.snp.left).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-8)
            make.width.height.equalTo(100)
        }
    }
    
    private func makeUsernameLabel() {
        addSubview(usernameLabel)
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(12)
            make.left.equalTo(contentView.snp.left).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-8)
            make.height.equalTo(20)
        }
    }
}

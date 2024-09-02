//
//  FollowerListViewController.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 2.09.2024.
//

import UIKit
import SnapKit

final class FollowerListViewController: UIViewController {
    
    var viewModel: FollowerListViewModelProtocol
    
    private var followers: [Follower] = []
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelpers.createThreeColumnFlowLayout(in: view))
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        configureUI()
    }
    
    init(viewModel: FollowerListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FollowerListViewController {
    private func configureUI(){
        makeCollectionView()
    }
    
    private func makeCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension FollowerListViewController: FollowerListViewModelDelegate {
    func handleViewModelOutput(_ output: FollowerListViewModelOutput) {
        switch output {
        case .setLoading(let isLoading):
            print(isLoading)
        case .showFollowerList(let followerList):
            followers = followerList
            collectionView.reloadData()
        case .updateFollowerList(let updatedFollowerList):
            updatedFollowerList.forEach { follower in
                followers.append(follower)
            }
            collectionView.reloadData()
        }
    }
}

extension FollowerListViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            viewModel.increasePage()
        }
    }
}

extension FollowerListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return followers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
        cell.set(follower: followers[indexPath.item])
        return cell
    }
}

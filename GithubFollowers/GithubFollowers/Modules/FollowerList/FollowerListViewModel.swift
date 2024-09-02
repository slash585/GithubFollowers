//
//  FollowerListViewModel.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 2.09.2024.
//

import Foundation

final class FollowerListViewModel: FollowerListViewModelProtocol {
    weak var delegate: FollowerListViewModelDelegate?
    
    var username: String?
    
    var page: Int = 1
    
    private let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol, username: String) {
        self.service = NetworkService.shared
        self.username = username
    }
    
    func viewDidLoad() {
        fetchFollowers(isUpdated: false)
    }
    
    func increasePage() {
        page += 1
        fetchFollowers(isUpdated: true)
    }
}

extension FollowerListViewModel {
    private func fetchFollowers(isUpdated: Bool){
        
        notify(.setLoading(true))
        
        let endpoint = Endpoint.getFollowers(username: self.username ?? "", perPage: 15, page: self.page)
        service.request(endpoint) { [weak self] (result: (Result<[Follower], Error>)) in
            
            guard let self else { return }
            self.notify(.setLoading(false))
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    if !isUpdated {
                        self.notify(.showFollowerList(data))
                    } else {
                        self.notify(.updateFollowerList(data))
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func notify(_ output: FollowerListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

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
    
    private let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol, username: String) {
        self.service = NetworkService.shared
        self.username = username
    }
    
    func viewDidLoad() {
        fetchFollowers()
    }
}

extension FollowerListViewModel {
    private func fetchFollowers(){
        
        notify(.setLoading(true))
        
        let endpoint = Endpoint.getFollowers(username: self.username ?? "", perPage: 100, page: 1)
        service.request(endpoint) { [weak self] (result: (Result<[Follower], Error>)) in
            
            guard let self else { return }
            self.notify(.setLoading(false))
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.notify(.showMovieList(data))
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

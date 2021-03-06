//
//  DiscoveriesInteractor.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 01/03/22.

class DiscoveriesInteractor: DiscoveriesPresenterToInteractorProtocol {
    weak var presenter: DiscoveriesInteractorToPresenterProtocol?
}

extension DiscoveriesInteractor {
    func getAllPost() {
        APIManager.shared.fetchAllPost { [weak self] result in
            self?.presenter?.didFetchAllPost(result: result)
        }
    }
    
    func fetchFavorite() {
        let result = UserDefaultManager.shared.getPosts()
        presenter?.didFetchFavorite(ids: result)
    }
}

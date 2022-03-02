//
//  FavoritesInteractor.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

class FavoritesInteractor: FavoritesPresenterToInteractorProtocol {
    weak var presenter: FavoritesInteractorToPresenterProtocol?
}

extension FavoritesInteractor {
    func fetchFavorite() {
        let result = UserDefaultManager.shared.getPosts()
        presenter?.didFetchFavorite(ids: result)
    }
    
    func getAllPosts() {
        APIManager.shared.fetchAllPost { [weak self] result in
            self?.presenter?.didGetAllPost(result: result)
        }
    }
}

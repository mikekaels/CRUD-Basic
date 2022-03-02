//
//  FavoritesPresenter.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

class FavoritesPresenter: FavoritesViewToPresenterProtocol {
    
    weak var view: FavoritesPresenterToViewProtocol?
    var router: FavoritesPresenterToRouterProtocol?
    var interactor: FavoritesPresenterToInteractorProtocol?
    
    func fetchFavorite() {
        interactor?.fetchFavorite()
    }
    
    func getAllPosts() {
        interactor?.getAllPosts()
    }
    
    func goToDetails(id: Int, from: FavoritesVC) {
        router?.goToDetails(id: id, from: from)
    }
    
}

extension FavoritesPresenter: FavoritesInteractorToPresenterProtocol {
    func didFetchFavorite(ids: [Int]) {
        view?.didFetchFavorite(ids: ids)
    }
    
    func didGetAllPost(result: Result<[Post], CustomError>) {
        switch result {
        case .success(let posts):
            view?.didFetchAllPost(allPost: posts)
        case .failure(let err):
            print(err)
        }
    }
}

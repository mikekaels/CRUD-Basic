//
//  DiscoveriesPresenter.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 01/03/22.

class DiscoveriesPresenter: DiscoveriesViewToPresenterProtocol {
    weak var view: DiscoveriesPresenterToViewProtocol?
    var router: DiscoveriesPresenterToRouterProtocol?
    var interactor: DiscoveriesPresenterToInteractorProtocol?
    
    func goToDetails(id: Int, from: DiscoveriesVC) {
        router?.goToDetails(id: id, from: from)
    }
    
    func getAllPost() {
        interactor?.getAllPost()
    }
    
    func goToCreate(from: DiscoveriesVC) {
        router?.goToCreate(from: from)
    }

}

extension DiscoveriesPresenter: DiscoveriesInteractorToPresenterProtocol {
    func didFetchAllPost(result: Result<[Post], CustomError>) {
        switch result {
        case .success(let posts):
            view?.didFetchAllPost(allPost: posts)
        case .failure(let err):
            print(err)
        }
    }
}

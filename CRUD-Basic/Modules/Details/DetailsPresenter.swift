//
//  DetailsPresenter.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

class DetailsPresenter: DetailsViewToPresenterProtocol {
    weak var view: DetailsPresenterToViewProtocol?
    var router: DetailsPresenterToRouterProtocol?
    var interactor: DetailsPresenterToInteractorProtocol?
    
    func back(from: DetailsVC) {
        router?.back(from: from)
    }
    
    func goToEdit(id: Int, title: String, content: String, from: DetailsVC) {
        router?.goToEdit(id: id, title: title, content: content, from: from)
    }
    
    func getDetailPost(id: Int) {
        interactor?.getDetailPost(id: id)
    }
    
    func deletePost(id: Int) {
        interactor?.deletePost(id: id)
    }
}

extension DetailsPresenter: DetailsInteractorToPresenterProtocol {
    func didDeletePost(result: Result<Post, CustomError>) {
        switch result {
        case .success(let post):
            view?.didSuccessDeletePost(post: post)
        case .failure(let err):
            view?.didFailedDeletePost(error: err)
        }
    }
    
    func didFetchDetailPost(result: Result<Post, CustomError>) {
        switch result {
        case .success(let post):
            view?.didSuccessFetchDetailPost(post: post)
        case .failure(let err):
            view?.didFailedFetchDetailPost(error: err)
        }
    }
    
    
}

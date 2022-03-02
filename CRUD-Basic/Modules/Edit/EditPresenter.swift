//
//  EditPresenter.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

class EditPresenter: EditViewToPresenterProtocol {
    
    weak var view: EditPresenterToViewProtocol?
    var router: EditPresenterToRouterProtocol?
    var interactor: EditPresenterToInteractorProtocol?
    
    func createPost(title: String, content: String) {
        interactor?.createPost(title: title, content: content)
    }
    
    func updatePost(title: String, content: String, id: Int) {
        interactor?.updatePost(title: title, content: content, id: id)
    }
    
    func goBack(from: EditVC) {
        router?.goBack(from: from)
    }
}

extension EditPresenter: EditInteractorToPresenterProtocol {
    func didCreatePost(result: Result<Post, CustomError>) {
        switch result {
        case .success(let post):
            view?.didSuccessCreatePost(post: post)
        case .failure(let error):
            view?.didErrorCreatePost(error: error)
        }
    }
    
    func didUpdatePost(result: Result<Post, CustomError>) {
        switch result {
        case .success(let post):
            view?.didSuccessUpdatePost(post: post)
        case .failure(let error):
            view?.didErrorUpdatePost(error: error)
        }
    }
}

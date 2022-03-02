//
//  DetailsInteractor.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

class DetailsInteractor: DetailsPresenterToInteractorProtocol {
    weak var presenter: DetailsInteractorToPresenterProtocol?
}

extension DetailsInteractor {
    func getDetailPost(id: Int) {
        APIManager.shared.detailPost(id: id) { [weak self] result in
            self?.presenter?.didFetchDetailPost(result: result)
        }
    }
    
    func deletePost(id: Int) {
        APIManager.shared.deletePost(id: id) {  [weak self] result in
            self?.presenter?.didDeletePost(result: result)
        }
    }
}


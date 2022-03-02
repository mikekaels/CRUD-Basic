//
//  EditInteractor.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

class EditInteractor: EditPresenterToInteractorProtocol {
    
    weak var presenter: EditInteractorToPresenterProtocol?
}

extension EditInteractor {
    func createPost(title: String, content: String) {
        APIManager.shared.createPost(title: title, content: content) { [weak self] result in
            self?.presenter?.didCreatePost(result: result)
        }
    }
    
    func updatePost(title: String, content: String, id: Int) {
        APIManager.shared.updatePost(title: title, content: content, id: id){ [weak self] result in
            self?.presenter?.didUpdatePost(result: result)
        }
    }
}

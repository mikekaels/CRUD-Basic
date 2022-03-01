//
//  DetailsPresenter.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

class DetailsPresenter: DetailsViewToPresenterProtocol {
    weak var view: DetailsPresenterToViewProtocol?
    var router: DetailsPresenterToRouterProtocol?
    var interactor: DetailsPresenterToInteractorProtocol?
    
    
}

extension DetailsPresenter: DetailsInteractorToPresenterProtocol {

}

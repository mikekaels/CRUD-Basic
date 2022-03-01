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
}

extension DiscoveriesPresenter: DiscoveriesInteractorToPresenterProtocol {

}

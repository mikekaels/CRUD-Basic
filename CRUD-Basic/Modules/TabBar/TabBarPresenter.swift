//
//  TabBarPresenter.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

class TabBarPresenter: TabBarViewToPresenterProtocol {
    weak var view: TabBarPresenterToViewProtocol?
    var router: TabBarPresenterToRouterProtocol?
    var interactor: TabBarPresenterToInteractorProtocol?
    
    
}

extension TabBarPresenter: TabBarInteractorToPresenterProtocol {

}

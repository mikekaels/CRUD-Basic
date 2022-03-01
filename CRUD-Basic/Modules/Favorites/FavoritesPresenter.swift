//
//  FavoritesPresenter.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

class FavoritesPresenter: FavoritesViewToPresenterProtocol {
    weak var view: FavoritesPresenterToViewProtocol?
    var router: FavoritesPresenterToRouterProtocol?
    var interactor: FavoritesPresenterToInteractorProtocol?
    
    
}

extension FavoritesPresenter: FavoritesInteractorToPresenterProtocol {

}

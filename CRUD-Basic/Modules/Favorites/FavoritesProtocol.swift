//
//  FavoritesProtocol.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

public protocol FavoritesDelegate {
    
}

protocol FavoritesViewToPresenterProtocol: AnyObject {
    var view: FavoritesPresenterToViewProtocol? { get set }
    var interactor: FavoritesPresenterToInteractorProtocol? { get set }
    var router: FavoritesPresenterToRouterProtocol? { get set }
}

protocol FavoritesPresenterToRouterProtocol: AnyObject {
    func createModule() -> FavoritesVC
}

protocol FavoritesPresenterToViewProtocol: AnyObject {

}

protocol FavoritesInteractorToPresenterProtocol: AnyObject {

}

protocol FavoritesPresenterToInteractorProtocol: AnyObject {
    var presenter: FavoritesInteractorToPresenterProtocol? { get set }

}

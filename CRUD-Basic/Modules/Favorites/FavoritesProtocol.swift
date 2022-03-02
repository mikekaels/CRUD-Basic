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
    
    func fetchFavorite()
    func getAllPosts()
    func goToDetails(id: Int, from: FavoritesVC)
}

protocol FavoritesPresenterToRouterProtocol: AnyObject {
    func createModule() -> FavoritesVC
    func goToDetails(id: Int, from: FavoritesVC)
}

protocol FavoritesPresenterToViewProtocol: AnyObject {
    func didFetchFavorite(ids: [Int])
    func didFetchAllPost(allPost: [Post])
}

protocol FavoritesInteractorToPresenterProtocol: AnyObject {
    func didFetchFavorite(ids: [Int])
    func didGetAllPost(result: Result<[Post], CustomError>)
}

protocol FavoritesPresenterToInteractorProtocol: AnyObject {
    var presenter: FavoritesInteractorToPresenterProtocol? { get set }
    func fetchFavorite()
    func getAllPosts()
}

//
//  DiscoveriesProtocol.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 01/03/22.

public protocol DiscoveriesDelegate {
    
}

protocol DiscoveriesViewToPresenterProtocol: AnyObject {
    var view: DiscoveriesPresenterToViewProtocol? { get set }
    var interactor: DiscoveriesPresenterToInteractorProtocol? { get set }
    var router: DiscoveriesPresenterToRouterProtocol? { get set }
    
    func goToDetails(id: Int, state: Bool, from: DiscoveriesVC)
    func getAllPost()
    func goToCreate(from: DiscoveriesVC)
    func fetchFavorite()
}

protocol DiscoveriesPresenterToRouterProtocol: AnyObject {
    func createModule() -> DiscoveriesVC
    func goToDetails(id: Int, state: Bool, from: DiscoveriesVC)
    func goToCreate(from: DiscoveriesVC)
}

protocol DiscoveriesPresenterToViewProtocol: AnyObject {
    func didFetchAllPost(allPost: [Post])
    func didFetchFavorite(ids: [Int])
}

protocol DiscoveriesInteractorToPresenterProtocol: AnyObject {
    func didFetchAllPost(result: Result<[Post], CustomError>)
    func didFetchFavorite(ids: [Int])
}

protocol DiscoveriesPresenterToInteractorProtocol: AnyObject {
    var presenter: DiscoveriesInteractorToPresenterProtocol? { get set }
    func getAllPost()
    func fetchFavorite()
}

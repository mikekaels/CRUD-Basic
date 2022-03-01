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
    
    func goToDetails(id: Int, from: DiscoveriesVC)
}

protocol DiscoveriesPresenterToRouterProtocol: AnyObject {
    func createModule() -> DiscoveriesVC
    func goToDetails(id: Int, from: DiscoveriesVC)
}

protocol DiscoveriesPresenterToViewProtocol: AnyObject {

}

protocol DiscoveriesInteractorToPresenterProtocol: AnyObject {

}

protocol DiscoveriesPresenterToInteractorProtocol: AnyObject {
    var presenter: DiscoveriesInteractorToPresenterProtocol? { get set }

}

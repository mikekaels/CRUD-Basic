//
//  DetailsProtocol.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

public protocol DetailsDelegate {
    
}

protocol DetailsViewToPresenterProtocol: AnyObject {
    var view: DetailsPresenterToViewProtocol? { get set }
    var interactor: DetailsPresenterToInteractorProtocol? { get set }
    var router: DetailsPresenterToRouterProtocol? { get set }
}

protocol DetailsPresenterToRouterProtocol: AnyObject {
    func createModule() -> DetailsVC
}

protocol DetailsPresenterToViewProtocol: AnyObject {

}

protocol DetailsInteractorToPresenterProtocol: AnyObject {

}

protocol DetailsPresenterToInteractorProtocol: AnyObject {
    var presenter: DetailsInteractorToPresenterProtocol? { get set }

}

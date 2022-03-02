//
//  FavoritesRouter.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

import UIKit

public class FavoritesRouter: FavoritesPresenterToRouterProtocol{
    
    public static let shared = FavoritesRouter()
    
    func initialize() -> FavoritesVC {
        return createModule()
    }
    
    func createModule() -> FavoritesVC {
        let view = FavoritesVC()
        
        let presenter: FavoritesViewToPresenterProtocol & FavoritesInteractorToPresenterProtocol = FavoritesPresenter()
        
        let interactor: FavoritesPresenterToInteractorProtocol = FavoritesInteractor()
        
        let router: FavoritesPresenterToRouterProtocol = FavoritesRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func goToDetails(id: Int, from: FavoritesVC) {
        let vc = DetailsRouter().createModule()
        vc.delegate = from
        vc.id = id
        vc.saved = true
        from.navigationController?.pushViewController(vc, animated: true)
    }
}

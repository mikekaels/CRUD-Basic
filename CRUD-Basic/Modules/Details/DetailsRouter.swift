//
//  DetailsRouter.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

import UIKit

public class DetailsRouter: DetailsPresenterToRouterProtocol{
    public static let shared = DetailsRouter()
    
    func initialize() -> DetailsVC {
        return createModule()
    }
    
    func createModule() -> DetailsVC {
        let view = DetailsVC()
        
        let presenter: DetailsViewToPresenterProtocol & DetailsInteractorToPresenterProtocol = DetailsPresenter()
        
        let interactor: DetailsPresenterToInteractorProtocol = DetailsInteractor()
        
        let router: DetailsPresenterToRouterProtocol = DetailsRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}

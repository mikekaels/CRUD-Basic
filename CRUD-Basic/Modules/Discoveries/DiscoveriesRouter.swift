//
//  DiscoveriesRouter.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 01/03/22.

import UIKit

public class DiscoveriesRouter: DiscoveriesPresenterToRouterProtocol{
    public static let shared = DiscoveriesRouter()
    
    func initialize() -> DiscoveriesVC {
        return createModule()
    }
    
    func createModule() -> DiscoveriesVC {
        let view = DiscoveriesVC()
        
        let presenter: DiscoveriesViewToPresenterProtocol & DiscoveriesInteractorToPresenterProtocol = DiscoveriesPresenter()
        
        let interactor: DiscoveriesPresenterToInteractorProtocol = DiscoveriesInteractor()
        
        let router: DiscoveriesPresenterToRouterProtocol = DiscoveriesRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func goToDetails(id: Int, state: Bool, from: DiscoveriesVC) {
        let vc = DetailsRouter().createModule()
        vc.delegate = from
        vc.id = id
        vc.saved = state
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToCreate(from: DiscoveriesVC) {
        let vc = EditRouter().createModule()
        vc.title = "New Post"
        vc.buttonState = "Create"
        vc.delegate = from
        from.navigationController?.pushViewController(vc, animated: true)
    }
}

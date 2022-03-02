//
//  EditRouter.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

import UIKit

public class EditRouter: EditPresenterToRouterProtocol{
    public static let shared = EditRouter()
    
    func initialize() -> EditVC {
        return createModule()
    }
    
    func createModule() -> EditVC {
        let view = EditVC()
        
        let presenter: EditViewToPresenterProtocol & EditInteractorToPresenterProtocol = EditPresenter()
        
        let interactor: EditPresenterToInteractorProtocol = EditInteractor()
        
        let router: EditPresenterToRouterProtocol = EditRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func goBack(from: EditVC) {
        from.navigationController?.popViewController(animated: true)
    }
}

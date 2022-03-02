//
//  DetailsProtocol.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

public protocol DetailsDelegate {
    func didDeletePost()
    func didRemoveFromFavorite()
}

protocol DetailsViewToPresenterProtocol: AnyObject {
    var view: DetailsPresenterToViewProtocol? { get set }
    var interactor: DetailsPresenterToInteractorProtocol? { get set }
    var router: DetailsPresenterToRouterProtocol? { get set }
    
    func back(from: DetailsVC)
    func goToEdit(id: Int, title: String, content: String, from: DetailsVC)
    func getDetailPost(id: Int)
    func deletePost(id: Int)
    func saveToFavorite(id: Int)
    func removeFromFavorite(id: Int)
}

protocol DetailsPresenterToRouterProtocol: AnyObject {
    func createModule() -> DetailsVC
    func back(from: DetailsVC)
    func goToEdit(id: Int, title: String, content: String, from: DetailsVC)
}

protocol DetailsPresenterToViewProtocol: AnyObject {
    func didSuccessFetchDetailPost(post: Post)
    func didFailedFetchDetailPost(error: CustomError)
    func didSuccessDeletePost(post: Post)
    func didFailedDeletePost(error: CustomError)
    func didSaveToFavorite(success: Bool)
    func didRemoveFromFavorite(success: Bool)
}

protocol DetailsInteractorToPresenterProtocol: AnyObject {
    func didFetchDetailPost(result: Result<Post, CustomError>)
    func didDeletePost(result: Result<Post, CustomError>)
    func didSaveToFavorite(success: Bool)
    func didRemoveFromFavorite(success: Bool)
}

protocol DetailsPresenterToInteractorProtocol: AnyObject {
    var presenter: DetailsInteractorToPresenterProtocol? { get set }
    func getDetailPost(id: Int)
    func deletePost(id: Int)
    func saveToFavorite(id: Int)
    func removeFromFavorite(id: Int)
}

//
//  EditProtocol.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

public protocol EditDelegate {
    func didSuccessCreateOrUpdatePost()
}

protocol EditViewToPresenterProtocol: AnyObject {
    var view: EditPresenterToViewProtocol? { get set }
    var interactor: EditPresenterToInteractorProtocol? { get set }
    var router: EditPresenterToRouterProtocol? { get set }
    
    func createPost(title: String, content: String)
    func updatePost(title: String, content: String, id: Int)
    func goBack(from: EditVC)
}

protocol EditPresenterToRouterProtocol: AnyObject {
    func createModule() -> EditVC
    func goBack(from: EditVC)
}

protocol EditPresenterToViewProtocol: AnyObject {
    func didSuccessCreatePost(post: Post)
    func didErrorCreatePost(error: CustomError)
    func didSuccessUpdatePost(post: Post)
    func didErrorUpdatePost(error: CustomError)
}

protocol EditInteractorToPresenterProtocol: AnyObject {
    func didCreatePost(result: Result<Post, CustomError>)
    func didUpdatePost(result: Result<Post, CustomError>)
}

protocol EditPresenterToInteractorProtocol: AnyObject {
    var presenter: EditInteractorToPresenterProtocol? { get set }
    func createPost(title: String, content: String)
    func updatePost(title: String, content: String, id: Int)

}

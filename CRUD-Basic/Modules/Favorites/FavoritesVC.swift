//
//  FavoritesVC.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

import UIKit

class FavoritesVC: UIViewController {
    var presentor: FavoritesViewToPresenterProtocol?
    public var delegate: FavoritesDelegate?
    
    lazy var table = PostTableViewController(items: [], configure: { (cell: PostTableViewCell, item: Post) in
       
    }) { (item) in
//        self.presentor?.goToDetails(id: item.id!, from: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        setupUI()
        table.items = [
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: "")
        ]
    }

}

extension FavoritesVC: FavoritesPresenterToViewProtocol {
    
}

extension FavoritesVC {
    func setupUI() {
        view.backgroundColor = Colors.background
        addChild(table)
        view.addSubview(table.view)
        table.didMove(toParent: self)
        
        table.view.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.bottom.leading.equalTo(view)
        }
    }
}

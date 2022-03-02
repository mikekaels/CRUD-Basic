//
//  FavoritesVC.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

import UIKit

class FavoritesVC: UIViewController {
    var presentor: FavoritesViewToPresenterProtocol?
    public var delegate: FavoritesDelegate?
    
    var ids: [Int] = [Int]()
    var posts: [Post] = [Post]()
    
    let refreshControl = UIRefreshControl()
        .configure { v in
            v.addTarget(self, action: #selector(fetchFavorite), for: .valueChanged)
            v.tintColor = Colors.title
        }
    
    lazy var table = PostTableViewController(items: [], configure: { (cell: PostTableViewCell, item: Post) in
        cell.cellConfig(id: item.id!, title: item.title!, saved: true)
    }) { (item) in
        self.presentor?.goToDetails(id: item.id!, from: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        setupUI()
        table.tableView.addSubview(refreshControl)
        fetchFavorite()
    }
    
    @objc func fetchFavorite() {
        presentor?.fetchFavorite()
    }

}

extension FavoritesVC: FavoritesPresenterToViewProtocol, DetailsDelegate {
    func didRemoveFromFavorite() {
        fetchFavorite()
    }
    
    func didDeletePost() {
        fetchFavorite()
    }
    
    func didFetchAllPost(allPost: [Post]) {
        var newPost: [Post] = [Post]()
        for id in ids {
            for item in allPost {
                if item.id == id {
                    newPost.append(item)
                }
            }
        }
        self.posts = newPost
        
        DispatchQueue.main.async { [weak self] in
            self?.table.items = self!.posts
        }
    }
    
    func didFetchFavorite(ids: [Int]) {
        self.ids = ids
        presentor?.getAllPosts()
        DispatchQueue.main.async { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
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

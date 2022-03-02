//
//  DiscoveriesVC.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 01/03/22.

import UIKit
import SnapKit

class DiscoveriesVC: UIViewController {
    var presentor: DiscoveriesViewToPresenterProtocol?
    public var delegate: DiscoveriesDelegate?
    
    var savedPost: [Int] = [Int]()
    
    let refreshControl = UIRefreshControl()
        .configure { v in
            v.addTarget(self, action: #selector(fetchFavorite), for: .valueChanged)
            v.tintColor = Colors.title
        }
    
    lazy var table = PostTableViewController(items: [], configure: { (cell: PostTableViewCell, item: Post) in

        cell.cellConfig(id: item.id!, title: item.title!, saved: false)
        
    }) { (item) in
        var state = false
        for i in self.savedPost {
            if i == item.id {
                state = true
            }
        }
        self.presentor?.goToDetails(id: item.id!, state: state, from: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        setupUI()
        fetchFavorite()
        table.tableView.addSubview(refreshControl)
    }
    
    @objc func createTapped() {
        presentor?.goToCreate(from: self)
    }
    
    @objc func fetchPosts() {
        presentor?.getAllPost()
    }
    
    @objc func fetchFavorite() {
        presentor?.fetchFavorite()
    }
}

extension DiscoveriesVC: DiscoveriesPresenterToViewProtocol, EditDelegate, DetailsDelegate {
    func didFetchFavorite(ids: [Int]) {
        self.savedPost = ids
        fetchPosts()
    }
    
    func didRemoveFromFavorite() {
        fetchFavorite()
    }
    
    func didDeletePost() {
        fetchFavorite()
    }
    
    func didSuccessCreateOrUpdatePost() {
        fetchFavorite()
    }
    
    func didFetchAllPost(allPost: [Post]) {
        DispatchQueue.main.async { [weak self] in
            self?.table.items = allPost
            self?.refreshControl.endRefreshing()
        }
    }
}

extension DiscoveriesVC {
    func setupUI() {
        view.backgroundColor = Colors.background
        addChild(table)
        view.addSubview(table.view)
        table.didMove(toParent: self)
        
        table.view.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.bottom.leading.equalTo(view)
        }
        
        let create = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(createTapped))
        navigationItem.rightBarButtonItems = [create]
    }
}

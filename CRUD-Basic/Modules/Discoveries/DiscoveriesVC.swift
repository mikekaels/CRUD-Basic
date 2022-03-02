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
    
    let refreshControl = UIRefreshControl()
        .configure { v in
            v.addTarget(self, action: #selector(fetchPosts), for: .valueChanged)
            v.tintColor = Colors.title
        }
    
    lazy var table = PostTableViewController(items: [], configure: { (cell: PostTableViewCell, item: Post) in
        cell.cellConfig(id: item.id!, title: item.title!)
    }) { (item) in
        self.presentor?.goToDetails(id: item.id!, from: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        setupUI()
        fetchPosts()
        table.tableView.addSubview(refreshControl)
    }
    
    @objc func createTapped() {
        presentor?.goToCreate(from: self)
    }
    
    @objc func fetchPosts() {
        presentor?.getAllPost()
    }
}

extension DiscoveriesVC: DiscoveriesPresenterToViewProtocol, EditDelegate, DetailsDelegate {
    func didDeletePost() {
        fetchPosts()
    }
    
    func didSuccessCreateOrUpdatePost() {
        fetchPosts()
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

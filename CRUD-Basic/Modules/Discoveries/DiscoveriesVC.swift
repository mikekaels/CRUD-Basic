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
    
    lazy var table = PostTableViewController(items: [], configure: { (cell: PostTableViewCell, item: Post) in
       
    }) { (item) in
        self.presentor?.goToDetails(id: item.id!, from: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        setupUI()
        table.items = [
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: ""),
            Post(id: 0, title: "", content: "", publishedAt: "", createdAt: "", updatedAt: "")
        ]
    }

}

extension DiscoveriesVC: DiscoveriesPresenterToViewProtocol {
    
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
    }
}

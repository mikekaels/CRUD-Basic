//
//  PostTableViewController.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 01/03/22.
//

import UIKit

class PostTableViewController<T, Cell: UITableViewCell>: UITableViewController {
    
    var items: [T] {
        didSet {
            self.tableView.reloadData()
        }
    }
    var configure: (PostTableViewCell, T) -> Void
    var selectHandler: (T) -> Void
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(items: [T], configure: @escaping (PostTableViewCell, T) -> Void, selectHandler: @escaping (T) -> Void) {
        self.items = items
        self.configure = configure
        self.selectHandler = selectHandler
        super.init(style: .plain)
        self.tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Identifiers.PostTableViewCell)
        self.tableView.contentInset.top = 20
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .clear
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.PostTableViewCell, for: indexPath) as! PostTableViewCell
        let item = items[indexPath.row]
        configure(cell, item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        selectHandler(item)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}

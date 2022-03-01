//
//  FavoritesVC.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

import UIKit

class FavoritesVC: UIViewController {
    var presentor: FavoritesViewToPresenterProtocol?
    public var delegate: FavoritesDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        // Do any additional setup after loading the view.
    }

}

extension FavoritesVC: FavoritesPresenterToViewProtocol {
    
}

//
//  DetailsVC.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

import UIKit

class DetailsVC: UIViewController {
    var presentor: DetailsViewToPresenterProtocol?
    public var delegate: DetailsDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        // Do any additional setup after loading the view.
        view.backgroundColor = Colors.background
    }

}

extension DetailsVC: DetailsPresenterToViewProtocol {
    
}

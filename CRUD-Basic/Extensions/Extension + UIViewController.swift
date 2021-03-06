//
//  Extension + UIViewController.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 01/03/22.
//

import UIKit

extension UIViewController {
    func navigationBarAppearance() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = Colors.background
            navigationController?.navigationBar.standardAppearance = appearance;
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            UISearchBar.appearance().tintColor = UIColor.white
        }
    }
}

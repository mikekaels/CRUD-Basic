//
//  DetailsVC.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

import UIKit
import SnapKit
import Kingfisher

class DetailsVC: UIViewController {
    var presentor: DetailsViewToPresenterProtocol?
    public var delegate: DetailsDelegate?
    
    private let scrollView = UIScrollView()
        .configure { v in
            v.contentOffset.x = 0
        }
    
    private let contentView = UIView()
        .configure { v in
        }
    
    private let ivPost = UIImageView()
        .configure { v in
            v.contentMode = .scaleAspectFill
            v.layer.masksToBounds = true
            v.kf.setImage(with: URL(string: "https://images.unsplash.com/photo-1502810365585-56ffa361fdde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"))
        }
    
    lazy var btnFavorite: UIButton = UIButton(type: .custom)
        .configure { v in
            v.imageView?.contentMode = .scaleAspectFill
            v.setImage(UIImage(systemName: "bookmark"), for: .normal)
            v.imageView?.snp.makeConstraints({ make in
                make.top.leading.bottom.trailing.equalTo(v).offset(2).inset(2)
            })
            v.addTarget(self, action: #selector(savedTapped), for: .touchUpInside)
            v.tintColor = Colors.subTitle
        }
    
    private let lblTitle = UILabel()
        .configure { v in
            v.font = UIFont.boldSystemFont(ofSize: 20)
            v.textColor = Colors.title
            v.text = "Lorem ipsum dolor sit amet"
            v.numberOfLines = 0
        }
    
    private let lblDescription = UILabel()
        .configure { v in
            v.font = UIFont.systemFont(ofSize: 15)
            v.textColor = Colors.title
            v.numberOfLines = 0
            v.textAlignment = .justified
            v.text = """
                    Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem
                    """
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        view.backgroundColor = Colors.background
        setupUI()
    }
    
    @objc func savedTapped() {
        print("tapped...")
    }

}

extension DetailsVC: DetailsPresenterToViewProtocol {
    
}

extension DetailsVC {
    func setupUI() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(view)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        contentView.addSubview(ivPost)
        ivPost.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.width.equalTo(contentView)
            make.height.equalTo(500)
        }
        
        contentView.addSubview(lblTitle)
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(ivPost.snp_bottomMargin).offset(20)
            make.leading.trailing.equalTo(contentView).offset(15).inset(15)
        }
        
        contentView.addSubview(lblDescription)
        lblDescription.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp_bottomMargin).offset(50)
            make.leading.trailing.equalTo(contentView).offset(15).inset(15)
            make.bottom.equalTo(contentView)
        }
        
        let favorite = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(savedTapped))
        let edit = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(savedTapped))
        let delete = UIBarButtonItem(image: UIImage(systemName: "trash.fill"), style: .plain, target: self, action: #selector(savedTapped))

        navigationItem.rightBarButtonItems = [delete, favorite, edit, ]
    }
}

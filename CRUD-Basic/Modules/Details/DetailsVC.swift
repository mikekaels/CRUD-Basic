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
    
    var id = 0
    var saved: Bool = false
    
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

    private let lblTitle = UILabel()
        .configure { v in
            v.font = UIFont.boldSystemFont(ofSize: 20)
            v.textColor = Colors.title
            v.numberOfLines = 0
        }
    
    private let lblDescription = UILabel()
        .configure { v in
            v.font = UIFont.systemFont(ofSize: 15)
            v.textColor = Colors.title
            v.numberOfLines = 0
            v.textAlignment = .justified
        }
    
    private let btnBack = UIButton()
        .configure { v in
            v.imageView?.contentMode = .scaleAspectFill
            v.setImage(UIImage(systemName: "chevron.backward.circle.fill"), for: .normal)
            v.imageView?.snp.makeConstraints({ make in
                make.top.leading.trailing.bottom.equalTo(v)
            })
            v.addTarget(self, action: #selector(back), for: .touchUpInside)
            v.tintColor = Colors.accent
        }
    
    let btnFavorite = UIButton()
        .configure { v in
            v.imageView?.contentMode = .scaleAspectFill
            v.setImage(UIImage(systemName: "bookmark"), for: .normal)
            
            v.addTarget(self, action: #selector(savedTapped), for: .touchUpInside)
            v.tintColor = Colors.accent
            
            v.snp.makeConstraints { make in
                make.height.width.equalTo(22)
            }
            
            v.imageView?.snp.makeConstraints({ make in
                make.height.width.equalTo(v)
            })
        }
    
    private let btnDelete = UIButton()
        .configure { v in
            v.imageView?.contentMode = .scaleAspectFill
            v.setImage(UIImage(systemName: "trash"), for: .normal)
            v.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
            v.tintColor = Colors.accent
            
            v.snp.makeConstraints { make in
                make.height.width.equalTo(22)
            }
            v.imageView?.snp.makeConstraints({ make in
                make.height.width.equalTo(v)
            })
        }
    
    private let btnEdit = UIButton()
        .configure { v in
            v.imageView?.contentMode = .scaleAspectFill
            v.setImage(UIImage(systemName: "pencil"), for: .normal)
            v.addTarget(self, action: #selector(editTapped), for: .touchUpInside)
            v.tintColor = Colors.accent
            v.snp.makeConstraints { make in
                make.height.width.equalTo(22)
            }
            
            v.imageView?.snp.makeConstraints({ make in
                make.height.width.equalTo(v)
            })
        }
    
    private let ivUser = UIImageView()
        .configure { v in
            v.layer.cornerRadius = 50
            v.contentMode = .scaleAspectFill
            v.layer.masksToBounds = true
            v.kf.setImage(with: URL(string: "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80"))
        }
    
    private let lblUser = UILabel()
        .configure { v in
            v.font = UIFont.italicSystemFont(ofSize: 18)
            v.textColor = Colors.subTitle
            v.text = "Mike"
            v.numberOfLines = 1
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        setupUI()
        fetchDetail()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupPostImageTransparent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: animated)
        changeBookmark()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func fetchDetail() {
        presentor?.getDetailPost(id: self.id)
    }
    
    @objc func back() {
        presentor?.back(from: self)
    }
    
    @objc func savedTapped() {
        if saved {
            saved = false
            presentor?.removeFromFavorite(id: self.id)
            delegate?.didRemoveFromFavorite()
        } else {
            saved = true
            presentor?.saveToFavorite(id: self.id)
            delegate?.didRemoveFromFavorite()
        }
        changeBookmark()
    }
    
    @objc func deleteTapped() {
        presentor?.deletePost(id: self.id)
    }
    
    @objc func editTapped() {
        presentor?.goToEdit(id: self.id, title: lblTitle.text!, content: lblDescription.text!, from: self)
    }

    func changeBookmark() {
        if saved {
            btnFavorite.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        } else {
            btnFavorite.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
    }
}

extension DetailsVC: DetailsPresenterToViewProtocol, EditDelegate {
    
    func didRemoveFromFavorite(success: Bool) {
        changeBookmark()
    }

    func didSaveToFavorite(success: Bool) {
        changeBookmark()
    }
    
    func didSuccessDeletePost(post: Post) {
        self.delegate?.didDeletePost()
        back()
    }

    func didSuccessCreateOrUpdatePost() {
        fetchDetail()
    }
    
    func didSuccessFetchDetailPost(post: Post) {
        DispatchQueue.main.async { [weak self] in
            self?.lblTitle.text = post.title
            self?.lblDescription.text = post.content
        }
    }
    
    func didFailedFetchDetailPost(error: CustomError) {
        print(error)
    }
    
    func didFailedDeletePost(error: CustomError) {
        print(error)
    }
    
    
    
}

extension DetailsVC {
    func setupUI() {
        
        let leftGesture = UISwipeGestureRecognizer(target: self, action: #selector(back))
        leftGesture.direction = .right
        self.view.addGestureRecognizer(leftGesture)
        
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
        }
        
        contentView.addSubview(btnBack)
        btnBack.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.top.equalTo(contentView).offset(15)
            make.leading.equalTo(contentView).offset(15)
        }
        
        let svButtons = UIStackView()
            .configure { v in
                v.axis = .horizontal
                v.spacing = 30
                [btnEdit, btnFavorite, btnDelete].forEach { v.addArrangedSubview($0)}
            }
        
        
        contentView.addSubview(svButtons)
        svButtons.snp.makeConstraints { make in
            make.centerY.equalTo(btnBack)
            make.trailing.equalTo(contentView).inset(15)
        }
        
        contentView.addSubview(ivUser)
        ivUser.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.equalTo(contentView)
            make.top.equalTo(lblDescription.snp_bottomMargin).offset(50)
        }
        
        contentView.addSubview(lblUser)
        lblUser.snp.makeConstraints { make in
            make.centerX.equalTo(ivUser)
            make.top.equalTo(ivUser.snp_bottomMargin).offset(20)
            make.bottom.equalTo(contentView).inset(50)
        }

    }
    
    func setupPostImageTransparent() {
        let maskedView = UIView(frame: CGRect(x: 0, y: 0, width: ivPost.frame.size.width, height: ivPost.frame.size.height))
        maskedView.backgroundColor = .white
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = maskedView.bounds
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientMaskLayer.locations = [0, 0.1, 0.9, 1]
        ivPost.layer.mask = gradientMaskLayer
    }
}

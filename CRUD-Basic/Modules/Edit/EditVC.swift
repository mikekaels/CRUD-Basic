//
//  EditVC.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.

import UIKit

class EditVC: UIViewController {
    var presentor: EditViewToPresenterProtocol?
    public var delegate: EditDelegate?
    
    var id = 0
    var buttonState = ""
    
    private let lblTitle = UILabel()
        .configure { v in
            v.text = "Title"
            v.font = UIFont.systemFont(ofSize: 13)
            v.textColor = Colors.subTitle
        }
    
    let tfTitle = UITextField()
        .configure { v in
            v.placeholder = "Title..."
            v.backgroundColor = .white
            v.layer.cornerRadius = 5
            v.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: v.frame.height))
            v.leftViewMode = .always
            v.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: v.frame.height))
            v.rightViewMode = .always
            v.clearButtonMode = .always
        }
    
    private let lblContent = UILabel()
        .configure { v in
            v.text = "Content"
            v.font = UIFont.systemFont(ofSize: 13)
            v.textColor = Colors.subTitle
        }
    
    let tfContent = UITextView()
        .configure { v in
            v.sizeToFit()
            v.isScrollEnabled = false
            v.translatesAutoresizingMaskIntoConstraints = true
            v.layer.cornerRadius = 5
            v.layer.masksToBounds = true
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc func buttonTapped() {
        if buttonState == "Create" {
            presentor?.createPost(title: tfTitle.text!, content: tfContent.text!)
        } else if buttonState == "Update" {
            presentor?.updatePost(title: self.tfTitle.text!, content: self.tfContent.text!, id: self.id)
        }
    }
}

extension EditVC: EditPresenterToViewProtocol {
    func didSuccessUpdatePost(post: Post) {
        print("👉 ", post)
        self.delegate?.didSuccessCreateOrUpdatePost()
        presentor?.goBack(from: self)
    }
    
    func didErrorUpdatePost(error: CustomError) {
        print(error)
    }
    
    func didSuccessCreatePost(post: Post) {
        self.delegate?.didSuccessCreateOrUpdatePost()
        presentor?.goBack(from: self)
    }
    
    func didErrorCreatePost(error: CustomError) {
        print(error)
    }
}

extension EditVC {
    func setupUI() {
        view.backgroundColor = Colors.background
        
        view.addSubview(lblTitle)
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.equalTo(view).offset(18)
        }
        
        view.addSubview(tfTitle)
        tfTitle.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp_bottomMargin).offset(15)
            make.leading.trailing.equalTo(view).offset(15).inset(15)
            make.height.equalTo(34)
        }
        
        view.addSubview(lblContent)
        lblContent.snp.makeConstraints { make in
            make.top.equalTo(tfTitle.snp_bottomMargin).offset(30)
            make.leading.equalTo(view).offset(18)
        }
        
        view.addSubview(tfContent)
        tfContent.snp.makeConstraints { make in
            make.top.equalTo(lblContent.snp_bottomMargin).offset(15)
            make.leading.trailing.equalTo(view).offset(15).inset(15)
        }
        
        
        let save = UIBarButtonItem(title: buttonState, style: .plain, target: self, action: #selector(buttonTapped))
        navigationItem.rightBarButtonItems = [save]
    }
}

//
//  PostTableViewCell.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 01/03/22.
//

import UIKit
import SnapKit
import Kingfisher

class PostTableViewCell: UITableViewCell {
    
    private var id = 0
    private var saved = false
    
    private let background = UIView()
        .configure { v in
            v.backgroundColor = Colors.cellBackground
            v.layer.cornerRadius = 10
        }
    
    private let ivPost = UIImageView()
        .configure { v in
            v.layer.cornerRadius = 10
            v.contentMode = .scaleAspectFill
            v.layer.masksToBounds = true
            v.kf.setImage(with: URL(string: "https://images.unsplash.com/photo-1502810365585-56ffa361fdde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"))
        }
    
    private let lblTitle = UILabel()
        .configure { v in
            v.font = UIFont.boldSystemFont(ofSize: 17)
            v.textColor = Colors.title
            v.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus rhoncus, enim nec venenatis tincidunt, massa odio vehicula neque, eget dapibus libero ex quis nisi."
            v.numberOfLines = 2
        }
    
    private let ivUser = UIImageView()
        .configure { v in
            v.layer.cornerRadius = 10
            v.contentMode = .scaleAspectFill
            v.layer.masksToBounds = true
            v.kf.setImage(with: URL(string: "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80"))
        }
    
    private let lblUser = UILabel()
        .configure { v in
            v.font = UIFont.systemFont(ofSize: 14)
            v.textColor = Colors.subTitle
            v.text = "Mike"
            v.numberOfLines = 1
        }
    
    private let ivTime = UIImageView()
        .configure { v in
            v.layer.cornerRadius = 10
            v.layer.masksToBounds = true
            v.image = UIImage(systemName: "clock")
            v.tintColor = Colors.subTitle
        }
    
    private let lblTime = UILabel()
        .configure { v in
            v.font = UIFont.systemFont(ofSize: 14)
            v.textColor = Colors.subTitle
            v.text = "6 min"
            v.numberOfLines = 1
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.selectionStyle = .none
        setupUI()
    }

}

extension PostTableViewCell {
    
    func cellConfig(id: Int, title: String, saved: Bool) {
        self.lblTitle.text = title
        self.id = id
        self.saved = saved
    }
    
    func setupUI() {
        backgroundColor = .clear
        
        contentView.addSubview(background)
        background.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentView).offset(30).inset(30)
            make.top.bottom.equalTo(contentView).offset(8).inset(8)
        }
        
        background.addSubview(ivPost)
        ivPost.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.centerY.equalTo(background)
            make.leading.equalTo(background).offset(10)
        }
        
        background.addSubview(lblTitle)
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(background).offset(15)
            make.leading.equalTo(ivPost.snp_trailingMargin).offset(25)
            make.trailing.equalTo(background).inset(5)
        }
        
        background.addSubview(ivUser)
        ivUser.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.leading.equalTo(ivPost.snp_trailingMargin).offset(25)
            make.bottom.equalTo(background).inset(15)
        }
        
        background.addSubview(lblUser)
        lblUser.snp.makeConstraints { make in
            make.centerY.equalTo(ivUser)
            make.leading.equalTo(ivUser.snp_trailingMargin).offset(15)
        }
        
        background.addSubview(ivTime)
        ivTime.snp.makeConstraints { make in
            make.width.height.equalTo(17)
            make.centerY.equalTo(ivUser)
            make.leading.equalTo(lblUser.snp_trailingMargin).offset(30)
        }
        
        background.addSubview(lblTime)
        lblTime.snp.makeConstraints { make in
            make.centerY.equalTo(ivUser)
            make.leading.equalTo(ivTime.snp_trailingMargin).offset(15)
        }
    }
}

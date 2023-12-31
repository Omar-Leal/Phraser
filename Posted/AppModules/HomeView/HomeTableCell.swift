//
//  TableViewCell.swift
//  Posted
//
//  Created by Omar Leal on 15/7/23.
//

import UIKit

protocol HomeTableViewCellDelegate: AnyObject {
    func handleReplyButton()
    func handleLikeButton()
    func handleShareButton()
}

class HomeTableCell: UITableViewCell {
    
   weak var delegate: HomeTableViewCellDelegate?
    
   static let cellID = "HomeTableCell"
   static let sampleText = "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a                        galley of type and scrambled it to make a type specimen book."
    
    private let avatarImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode =         .scaleToFill
        image.layer.cornerRadius =  25
        image.layer.masksToBounds = true
        image.clipsToBounds =       true
        image.image =               UIImage(systemName: "person")
        image.backgroundColor =     .yellow
        return image
    }()
    
    private let displayedName:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Valentina Leal"
        return label
    }()
    
    private let userName:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =      .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .secondaryLabel
        label.text =      "@tinita25"
        return label
    }()
    
    private let postedText: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text =           sampleText
        text.font =          .systemFont(ofSize: 14, weight: .regular)
        text.numberOfLines = 0
        
        return text
    } ()
    
    private let replyButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        btn.tintColor = .secondaryLabel
        return btn
    }()
    
    private let shareButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "square.and.arrow.up.circle"), for: .normal)
        btn.tintColor = .secondaryLabel
        return btn
    }()
    
    private let likeButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        btn.tintColor = .secondaryLabel
        return btn
    }()
    
    private let convertToImage: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "arrowshape.turn.up.left.2.fill"), for: .normal)
        btn.tintColor = .secondaryLabel
        return btn
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [ avatarImage,
          displayedName,
          userName,
          postedText,
          replyButton,
          shareButton,
          likeButton
        ].forEach(contentView.addSubview)
        constraintsRules()
        configureButtons()
    }
    
    
  /***  CONFIGURING BUTTONS */
    @objc private func tapReply() {
        delegate?.handleReplyButton()
    }
    
    @objc private func tapShare() {
        delegate?.handleShareButton()
    }
    
    @objc private func tapLike() {
        delegate?.handleLikeButton()
    }
    
    
    private func configureButtons() {
        replyButton.addTarget(self, action: #selector(tapReply), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(tapShare), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(tapLike), for: .touchUpInside)
    }
    
    /***  CONFIGURING BUTTONS */
    
    
    
    
    
    
    private func constraintsRules() {
        let avatar = [
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            avatarImage.heightAnchor.constraint(equalToConstant: 50),
            avatarImage.widthAnchor.constraint(equalToConstant: 50)
        ]
        
        let displayname = [
            displayedName.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20),
            displayedName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            ]
        
        let username = [
            userName.leadingAnchor.constraint(equalTo: displayedName.trailingAnchor, constant: 20),
            userName.centerYAnchor.constraint(equalTo: displayedName.centerYAnchor)
        ]
        
        let content = [
            postedText.leadingAnchor.constraint(equalTo: displayedName.leadingAnchor),
            postedText.topAnchor.constraint(equalTo: displayedName.topAnchor, constant: 20),
            postedText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            //postedText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ]
        
        
        let replyBtn = [
            replyButton.leadingAnchor.constraint(equalTo: postedText.leadingAnchor),
            replyButton.topAnchor.constraint(equalTo: postedText.bottomAnchor, constant: 2),
            replyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ]
        
        let sharebtn = [
            shareButton.leadingAnchor.constraint(equalTo: replyButton.trailingAnchor, constant: 60),
            shareButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor),
            
            
        ]
        
        let likeBtnConstraints = [
            likeButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: 60),
            likeButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
        ]
     
        
        
        [ avatar,
          displayname,
          username,
          content,
          replyBtn,
          sharebtn,
          likeBtnConstraints
        ].forEach(NSLayoutConstraint.activate)
       
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

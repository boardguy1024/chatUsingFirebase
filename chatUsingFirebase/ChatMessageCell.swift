//
//  ChatMessageCell.swift
//  chatUsingFirebase
//
//  Created by park kyung suk on 2017/07/15.
//  Copyright © 2017年 park kyung suk. All rights reserved.
//

import UIKit

class ChatMessageCell: UICollectionViewCell {
    
    var chatLogController: ChatLogController?
    
    let textView: UITextView = {
    
        let tv = UITextView()
        tv.text = "Sample Text!"
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.textColor = .white
        tv.isEditable = false
        return tv
    }()
    
    let bubbleView: UIView = {
       let view = UIView()
        view.backgroundColor = blueColor
        view.layer.cornerRadius = 18
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "dummy.jpg")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 17
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var messageImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleZoomTap)))
        return imageView
    }()
    
    var bubbleWidthAnchor: NSLayoutConstraint?
    var bubbleleftAnchor: NSLayoutConstraint?
    var bubbleRightAnchor: NSLayoutConstraint?
    
    func handleZoomTap(tapGesture: UITapGestureRecognizer) {
        
        guard let tappedImageView = tapGesture.view as? UIImageView else { return }
        
        //ChatLogControllerのDelegateメソッドを呼び出す。
        self.chatLogController?.performZoomInForStaringImageView(startingImageView: tappedImageView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bubbleView)
        addSubview(textView)
        addSubview(profileImageView)
        
        //送受信するイメージをbubbleViewにattempt
        bubbleView.addSubview(messageImageView)
        
        //messageImageView constraint
        messageImageView.leftAnchor.constraint(equalTo: bubbleView.leftAnchor).isActive = true
        messageImageView.topAnchor.constraint(equalTo: bubbleView.topAnchor).isActive = true
        messageImageView.widthAnchor.constraint(equalTo: bubbleView.widthAnchor).isActive = true
        messageImageView.heightAnchor.constraint(equalTo: bubbleView.heightAnchor).isActive = true
        
        //bubbleView constraint
        bubbleleftAnchor = bubbleView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8)
        bubbleRightAnchor = bubbleView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8)
        bubbleRightAnchor?.isActive = true
        
        bubbleView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bubbleWidthAnchor = bubbleView.widthAnchor.constraint(equalToConstant: 200)
        bubbleWidthAnchor?.isActive = true
        
        bubbleView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

        //textView constraint
        textView.leftAnchor.constraint(equalTo: bubbleView.leftAnchor, constant: 8).isActive = true
        textView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: bubbleView.rightAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        //profileImageView constraint
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 34).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 34).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

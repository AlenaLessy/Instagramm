//
//  PostTableViewCell.swift
//  Insragram
//
//  Created by Алена Панченко on 20.10.2022.
//

import UIKit

/// Ячейка поста (экран home)
final class PostTableViewCell: UITableViewCell {
    
    // MARK: - Private Outlets
    @IBOutlet weak private var userPhotoImageView: UIImageView!
    @IBOutlet weak private var userNickNameLabel: UILabel!
    @IBOutlet weak private var userImageView: UIImageView!
    @IBOutlet weak private var userPhotoPostImageView: UIImageView!
    @IBOutlet weak private var userNickLabel: UILabel!
    @IBOutlet weak private var userPostLabel: UILabel!
    
    // MARK: - Public Methods
    func update(_ userPost: UserPost) {
        userPhotoImageView.image = UIImage(named: userPost.userPhotoImageName)
        userPhotoPostImageView.image = UIImage(named: userPost.userPhotoImageName)
        userNickLabel.text = userPost.userNickName
        userNickNameLabel.text = userPost.userNickName
        userImageView.image = UIImage(named: userPost.userImageName)
        userPostLabel.text = userPost.userPost
    }
}

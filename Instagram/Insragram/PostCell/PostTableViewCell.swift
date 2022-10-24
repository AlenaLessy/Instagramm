//
//  PostTableViewCell.swift
//  Insragram
//
//  Created by Алена Панченко on 20.10.2022.
//

import UIKit

/// Ксиб Ячейки поста
final class PostTableViewCell: UITableViewCell {
    
    // MARK: - Private Outlets
    @IBOutlet weak private var userPhotoImageView: UIImageView!
    @IBOutlet weak private var userNickNameLabel: UILabel!
    @IBOutlet weak private var userImageView: UIImageView!
    @IBOutlet weak private var userPhotoPostImageView: UIImageView!
    @IBOutlet weak private var userNickLabel: UILabel!
    @IBOutlet weak private var userPostLabel: UILabel!
    
    // MARK: - Public Methods
    func update(_ userPostModel: UserPost) {
        userPhotoImageView.image = UIImage(named: userPostModel.userPhotoImageName)
        userPhotoPostImageView.image = UIImage(named: userPostModel.userPhotoImageName)
        userNickLabel.text = userPostModel.userNickName
        userNickNameLabel.text = userPostModel.userNickName
        userImageView.image = UIImage(named: userPostModel.userImageName)
        userPostLabel.text = userPostModel.userPost
    }
}

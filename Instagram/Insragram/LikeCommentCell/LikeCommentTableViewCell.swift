//
//  likeCommentTableViewCell.swift
//  Insragram
//
//  Created by Алена Панченко on 21.10.2022.
//

import UIKit

// Ячейка лайка коммента (экран лайков)
final class LikeCommentTableViewCell: UITableViewCell {
// MARK: - Private Outlets
    @IBOutlet weak private var userPhotoImageView: UIImageView!
    @IBOutlet weak private var userNickLabel: UILabel!
    @IBOutlet weak private var mentionedUserLabel: UILabel!
    @IBOutlet weak private var commentLabel: UILabel!
    @IBOutlet weak private var timeLabel: UILabel!
    @IBOutlet weak private var storyImageView: UIImageView!
    
    // MARK: - Public Methods
    func update(_ likeComment: LikeComment) {
        userPhotoImageView.image = UIImage(named: likeComment.userPhotoImageName)
        userNickLabel.text = likeComment.userNickName
        mentionedUserLabel.text = likeComment.mentionedUser
        commentLabel.text = likeComment.comment
        timeLabel.text = likeComment.time
        storyImageView.image = UIImage(named: likeComment.storyImageName)
    }
}

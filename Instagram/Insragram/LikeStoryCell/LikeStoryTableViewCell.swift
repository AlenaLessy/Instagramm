//
//  LikeStoryTableViewCell.swift
//  Insragram
//
//  Created by Алена Панченко on 20.10.2022.
//

import UIKit

// Ячейка лайка сторис
final class LikeStoryTableViewCell: UITableViewCell {
    // MARK: - Private Outlets

    @IBOutlet weak private var userPhotoImageView: UIImageView!
    @IBOutlet weak private var userNickNameLabel: UILabel!
    @IBOutlet weak private var storyImageView: UIImageView!
    @IBOutlet weak private var timeLabel: UILabel!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public Methods
    
    func update(_ model: LikeStoryModel) {
        userPhotoImageView.image = UIImage(named: model.userPhotoImageName)
        userNickNameLabel.text = model.userNickName
        storyImageView.image = UIImage(named: model.storyImageName)
        timeLabel.text = model.time
    }
}

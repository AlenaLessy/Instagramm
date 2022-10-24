//
//  SubscribTableViewCell.swift
//  Insragram
//
//  Created by Алена Панченко on 21.10.2022.
//

import UIKit

// Ячейка подписки (экран лайков)
class SubscribTableViewCell: UITableViewCell {
    
    // MARK: - Private Outlets
    @IBOutlet weak private var userPhotoImageView: UIImageView!
    @IBOutlet weak private var userNameLabel: UILabel!
    @IBOutlet weak private var userNickLabel: UILabel!
    @IBOutlet weak private var timeLabel: UILabel!
    
    // MARK: - Public Methods
    func update(_ subscrib: Subscrib) {
        userPhotoImageView.image = UIImage(named: subscrib.userPhotoImageName)
        userNickLabel.text = subscrib.userNick
        userNameLabel.text = subscrib.userName
        timeLabel.text = subscrib.time
    }
}

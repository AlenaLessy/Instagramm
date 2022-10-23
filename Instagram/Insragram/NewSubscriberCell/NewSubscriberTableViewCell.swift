//
//  NewSubscriberTableViewCell.swift
//  Insragram
//
//  Created by Алена Панченко on 21.10.2022.
//

import UIKit

// Ячейка нового подписчика
final class NewSubscriberTableViewCell: UITableViewCell {
 // MARK: - Private Outlets
    @IBOutlet weak private var userPhotoImageView: UIImageView!
    @IBOutlet weak private var userNickLabel: UILabel!
    @IBOutlet weak private var timeLabel: UILabel!
  
    // MARK: - Public Methods
    func update(_ newSubscriber: NewSubscriber) {
        userPhotoImageView.image = UIImage(named: newSubscriber.userPhotoImageName)
        userNickLabel.text = newSubscriber.userNickName
        timeLabel.text = newSubscriber.time
    }
}

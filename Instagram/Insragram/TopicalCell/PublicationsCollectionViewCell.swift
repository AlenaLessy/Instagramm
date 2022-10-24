//
//  TopicalCollectionViewCell.swift
//  Insragram
//
//  Created by Алена Панченко on 23.10.2022.
//

import UIKit
// Ячейка коллекции
final class PublicationsCollectionViewCell: UICollectionViewCell {
    // MARK: Private Outlets
    @IBOutlet weak private var imageView: UIImageView!
    
    // MARK: - Public Methods
    func update(_ topic: Topic) {
        imageView.image = UIImage(named: topic.postImageName)
    }
    
}

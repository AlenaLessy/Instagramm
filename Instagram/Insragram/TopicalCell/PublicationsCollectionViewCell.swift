//
//  TopicalCollectionViewCell.swift
//  Insragram
//
//  Created by Алена Панченко on 23.10.2022.
//

import UIKit
// Ячейка коллекции
final class PublicationsCollectionViewCell: UICollectionViewCell {
    // MARK: Public Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Public Methods
    func update(_ model: Topic) {
        imageView.image = UIImage(named: model.postImageName)
    }
    
}

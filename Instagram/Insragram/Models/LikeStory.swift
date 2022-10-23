//
//  LikeStoryModel.swift
//  Insragram
//
//  Created by Алена Панченко on 20.10.2022.
//

import Foundation

/// Модель лайк сторис
struct LikeStory: LikeInstagramProtocol {
    var userPhotoImageName: String
    var userNickName: String
    var storyImageName: String
    var time: String
}

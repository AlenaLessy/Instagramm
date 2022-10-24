//
//  likeComment.swift
//  Insragram
//
//  Created by Алена Панченко on 22.10.2022.
//

import Foundation

// модель лайка комментария
struct LikeComment: LikeInstagramProtocol {
    var userPhotoImageName: String
    var userNickName: String
    var storyImageName: String
    var comment: String
    var mentionedUser: String
    var time: String
}

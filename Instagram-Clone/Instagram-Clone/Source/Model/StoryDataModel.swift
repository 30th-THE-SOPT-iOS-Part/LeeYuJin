//
//  StoryDataModel.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/05/06.
//

import UIKit

struct StoryDataModel {
    let profileImageName: String
    var profileImage: UIImage? {
        return UIImage(named: profileImageName)
    }
    let id: String
}

extension StoryDataModel{
    static let sampleData: [StoryDataModel] = [
        StoryDataModel(profileImageName: "avatar1", id: "haeuniya"),
        StoryDataModel(profileImageName: "avatar2", id: "yujinnee"),
        StoryDataModel(profileImageName: "avatar3", id: "uuuuuuuy"),
        StoryDataModel(profileImageName: "avatar4", id: "hannapril"),
        StoryDataModel(profileImageName: "avatar5", id: "su9enie"),
        StoryDataModel(profileImageName: "avatar6", id: "daniyeonwoo"),
        StoryDataModel(profileImageName: "avatar5", id: "su9enie"),
        StoryDataModel(profileImageName: "avatar6", id: "daniyeonwoo"),
        StoryDataModel(profileImageName: "avatar5", id: "su9enie"),
        StoryDataModel(profileImageName: "avatar6", id: "daniyeonwoo")
    ]
}

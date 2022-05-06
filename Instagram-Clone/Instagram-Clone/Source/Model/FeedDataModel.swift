//
//  FeedDataModel.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/05/06.
//

import UIKit

struct FeedDataModel {
    let profileImageName: String
    var profileImage: UIImage? {
        return UIImage(named: profileImageName)
    }
    let photoImageName: String
    var photoImage: UIImage? {
        return UIImage(named: photoImageName)
    }
    let id: String
    let likesNum: String
    let feedText: String
    let commentsNum: String
}

extension FeedDataModel{
    static let sampleData: [FeedDataModel] = [
        FeedDataModel(profileImageName: "avatar1", photoImageName: "postImage1", id: "avatar1", likesNum: "30", feedText: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", commentsNum: "19"),
        FeedDataModel(profileImageName: "avatar2", photoImageName: "postImage2", id: "avatar2", likesNum: "330", feedText: "⏰ 큰 목표를 이루고 싶으면 허락을 구하지 마라", commentsNum: "24"),
        FeedDataModel(profileImageName: "avatar3", photoImageName: "postImage3", id: "avatar3", likesNum: "130", feedText: "🌱 늘 하던 대로 하면 늘 얻던 것을 얻는다. ", commentsNum: "100"),
        FeedDataModel(profileImageName: "avatar4", photoImageName: "postImage4", id: "avatar4", likesNum: "30", feedText: "🌱 놀러가고 싶다", commentsNum: "199")
      
    ]
}


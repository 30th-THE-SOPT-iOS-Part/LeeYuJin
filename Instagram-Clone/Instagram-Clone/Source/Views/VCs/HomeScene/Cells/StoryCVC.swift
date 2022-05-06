//
//  StoryTVC.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/05/06.
//

import UIKit

class StoryCVC: UICollectionViewCell {
    
    static let identifier = "StoryCVC"

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(_ storyData: StoryDataModel){
        profileImageView.image = storyData.profileImage
        idLabel.text = storyData.id
    }
}

//
//  MusicTableViewCell.swift
//  Sopt-3rd-Seminar
//
//  Created by 이유진 on 2022/04/23.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    static let identifier = "MusicTableViewCell"
    
    @IBOutlet weak var albumCoverImage: UIImageView!
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var musicDescriptionLabel: UILabel!
    @IBOutlet weak var moveButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ musicData: MusicDataModel) {
            albumCoverImage.image = musicData.albumImage
            musicTitleLabel.text = musicData.musicTitle
            musicDescriptionLabel.text = musicData.description
        }
}

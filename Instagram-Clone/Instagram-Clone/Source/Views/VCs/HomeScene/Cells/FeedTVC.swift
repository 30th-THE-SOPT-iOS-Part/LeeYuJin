//
//  FeedTVC.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/05/06.
//

import UIKit

protocol TabLikeButtonDelegate{
    func tabLikeButton(cell: FeedTVC)
}

class FeedTVC: UITableViewCell {
    static let identifier = "FeedTVC"

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var likeNumLabel: UILabel!
    
    @IBOutlet weak var belowIdLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var seeMoreCommentButton: UIButton!
    @IBOutlet weak var keepButton: UIButton!
    
    var tabLikeButtonDelegate: TabLikeButtonDelegate?
    
    var isLike = false//좋아요 여부 
    
    @IBAction func tapLikeButton(_ sender: Any) {
        tabLikeButtonDelegate?.tabLikeButton(cell: self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(feedData: FeedDataModel){
        profileImageView.image = feedData.profileImage
        idLabel.text = feedData.id
        photoImageView.image = feedData.photoImage
        
        if let height = feedData.photoImage?.size.height{//이미지 크기에 맞춰서 이미지뷰 사이즈 변경
            photoImageView.snp.remakeConstraints{
                $0.height.equalTo(height)
            }
        }
        contentLabel.text = feedData.feedText
        likeNumLabel.text = "좋아요 \(feedData.likesNum)개"
        belowIdLabel.text = feedData.id
        commentButton.titleLabel?.text = "댓글 \(feedData.commentsNum)개 모두 보기"
    }
    
}

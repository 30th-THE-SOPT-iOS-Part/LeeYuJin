//
//  HeaderBarView.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/05/06.
//

import UIKit

class HeaderBarView: UIView {
    
    private let logoImageView = UIImageView().then{
        $0.image = UIImage(named: "Instagram Black Logo")
    }
    
    private let addButton = UIButton().then{
        $0.setImage(UIImage(named: "icn_add"), for: .normal)
    }
    
    private let likeButton = UIButton().then{
        $0.setImage(UIImage(named: "icn_unlike"), for: .normal)
    }
    
    private let shareButton = UIButton().then{
        $0.setImage(UIImage(named: "icn_share"), for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        
        backgroundColor = .white
        addSubViews([logoImageView,shareButton,likeButton,addButton])
        
        logoImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(96)
            $0.height.equalTo(27)
        }
        shareButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-14)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        likeButton.snp.makeConstraints{
            $0.trailing.equalTo(shareButton.snp.leading).offset(-16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        addButton.snp.makeConstraints{
            $0.trailing.equalTo(likeButton.snp.leading).offset(-16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
       
    }

}

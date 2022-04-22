//
//  AuthButton.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/04/10.
//

import UIKit

class AuthButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String) {
        super.init(frame: .zero)
        setUI(title: title)
    }
    
    private func setUI(title: String) {
        
        if #available(iOS 15.0, *) {//iOS 15 이상은 Configuration 이용해서 버튼 설정
            var configuration = UIButton.Configuration.filled()
            
            configuration.baseBackgroundColor = .systemBlue
            configuration.baseForegroundColor = .white
            var attText = AttributedString(title)
            attText.font = .systemFont(ofSize: 16)
            configuration.attributedTitle = attText
            configuration.background.cornerRadius = 6
            self.configuration = configuration
        } else {//iOS 15 이전 버전은 Configuration이 없으므로 이전의 방식으로 버튼 설정
            backgroundColor = .systemBlue
            setTitleColor(.white, for: .normal)
            setTitle(title, for: .normal)
            titleLabel?.font = .systemFont(ofSize: 16)
            clipsToBounds = true
            layer.cornerRadius = 6
        }
        
        self.snp.makeConstraints {
            $0.height.equalTo(50)
        }
    }
    
}

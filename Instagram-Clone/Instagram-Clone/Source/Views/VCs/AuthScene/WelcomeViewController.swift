//
//  WelcomeViewController.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/04/10.
//

import UIKit

import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    var userName: String?
    
    private let titleLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let subtitleLabel = UILabel().then {
        $0.text = "언제든지 연락처 정보와 사용자 이름을 변경할 수 있습니다."
        $0.numberOfLines = 1
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .lightGray
    }
    
    private lazy var completeButton = AuthButton(title: "완료하기")
    
    private lazy var  otherAccountButton = UIButton().then {
        $0.setTitle("다른계정으로 로그인하기", for: .normal)
        $0.setTitleColor(.accentBlue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setLayout()
        setTitle()
    }
    
    func configUI() {
        completeButton.addTarget(self, action: #selector(completeButtonClicked(_:)), for: .touchUpInside)
        otherAccountButton.addTarget(self, action: #selector(otherAccountButtonClicked(_:)), for: .touchUpInside)
    }
    
    func setLayout() {
        self.navigationController?.isNavigationBarHidden = true
        view.addSubViews([titleLabel, subtitleLabel, completeButton, otherAccountButton])
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(300)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        completeButton.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        otherAccountButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(completeButton.snp.bottom).offset(20)
        }
    }
    
    private func setTitle() {
        if let userName = self.userName{
            titleLabel.text = "\(userName)님 Instargram에 \n 오신 것을 환영합니다"
        }
        
    }
    
    @objc private func completeButtonClicked(_ sender: UIButton){
        guard let nextVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {return}

        self.view.window?.rootViewController = nextVC
    }
    
    @objc private func otherAccountButtonClicked(_ sender: UIButton){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

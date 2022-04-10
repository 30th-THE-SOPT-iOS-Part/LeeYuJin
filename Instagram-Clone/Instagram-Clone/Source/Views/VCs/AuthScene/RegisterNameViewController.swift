//
//  RegisterNameViewController.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/04/10.
//

import UIKit

import SnapKit
import Then

final class RegisterNameViewController: UIViewController {
    
    
    private let previousButton = UIButton().then{
        $0.setImage(UIImage(named: "icn_back_24"), for: .normal)
    }

    private let titleLabel = UILabel().then {
        $0.text = "사용자 이름 만들기"
        $0.font = .systemFont(ofSize: 25)
        $0.textColor = .black
    }

    private let subTitleLabel = UILabel().then {
        $0.text = "새 계정에 사용할 사용자 이름을 선택하세요. 나중에\n언제든지 변경할 수 있습니다."
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .lightGray
    }

    private lazy var userNameTextField = AuthTextField(type: .basic, placeHolder: "사용자 이름").then {
        $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            
    }

    private lazy var nextButton = AuthButton(title: "다음").then {
        $0.isEnabled = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setLayout()
    }


    func configUI() {
        nextButton.addTarget(self, action: #selector(nextButtonClicked(_:)), for: .touchUpInside)
    }

    func setLayout() {
        self.navigationController?.navigationBar.isHidden = true
        
        view.addSubViews([previousButton,titleLabel, subTitleLabel, userNameTextField, nextButton])
        previousButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }

        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(100)
        }

        subTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }

        userNameTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(20)
        }

        nextButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(userNameTextField.snp.bottom).offset(20)
        }
    }
    @objc private func nextButtonClicked(_ sender: UIButton){
       
        guard let nextVC = UIStoryboard(name: "RegisterPassword", bundle: nil).instantiateViewController(withIdentifier: "RegisterPasswordViewController") as? RegisterPasswordViewController else {return}
        nextVC.userName = self.userNameTextField.text ?? ""
        self.navigationController?.pushViewController(nextVC, animated: true)
     }
    
    @objc
    private func textFieldDidChange(_ sender: UITextField) {
        if userNameTextField.hasText{
            nextButton.isEnabled = true
        }else{
            nextButton.isEnabled = false
        }
    }
}

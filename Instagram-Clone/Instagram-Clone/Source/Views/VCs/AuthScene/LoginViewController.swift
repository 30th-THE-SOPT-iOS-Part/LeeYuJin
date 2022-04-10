//
//  LoginViewController.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/04/10.
//

import UIKit

import SnapKit
import Then

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        configUI()
    }
    
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "Instagram Black Logo")
    }
    
    
    private let emailTextField = AuthTextField(type: .basic, placeHolder: "전화번호, 사용자 이름 또는 이메일")
    
    private let passwordTextField = AuthTextField(type: .password, placeHolder: "비밀번호")
    
    private let forgotPasswordButton = UIButton().then {
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 13)
    }
    
    private lazy var loginButton = AuthButton(title: "로그인").then {
        $0.isEnabled = false
    }
    
    private let signUpLabel = UILabel().then {
        $0.text = "계정이 없으신가요?"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 15)
    }
    
    private lazy var signUpButton = UIButton().then {
        $0.setTitle("가입하기", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 17)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    /// 화면 터치했을 때 텍스트 필드 edit 종료하기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func configUI() {
        setTextField()
    }
    
    func setLayout() {

        view.addSubViews([logoImage, emailTextField, passwordTextField, forgotPasswordButton, loginButton, signUpLabel, signUpButton])
        
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        forgotPasswordButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(15)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgotPasswordButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        signUpLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
        }
        
        signUpButton.snp.makeConstraints {
            $0.centerY.equalTo(signUpLabel.snp.centerY)
            $0.leading.equalTo(signUpLabel.snp.trailing).offset(10)
        }
    }
    
    private func setTextField() {
        [emailTextField, passwordTextField].forEach {
            $0.delegate = self
            $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    @objc
    private func textFieldDidChange(_ sender: AuthTextField) {
        loginButton.isEnabled = (emailTextField.hasText && passwordTextField.hasText) ? true : false
    }
    
}

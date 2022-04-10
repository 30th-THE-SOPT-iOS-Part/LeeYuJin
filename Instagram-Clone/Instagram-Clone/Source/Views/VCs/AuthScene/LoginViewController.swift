//
//  LoginViewController.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/04/10.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        configUI()
    }
    
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "Instagram Black Logo")
    }
    
    
    private let emailTextField = AuthTextField(type: .basic, placeHolder: "전화번호, 사용자 이름 또는 이메일").then {
        $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private let passwordTextField = AuthTextField(type: .password, placeHolder: "비밀번호").then{
        $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private let forgotPasswordButton = UIButton().then {
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 13)
    }
    
    private lazy var loginButton = AuthButton(title: "로그인").then {
        $0.isEnabled = false
    }
    
    private let registerLabel = UILabel().then {
        $0.text = "계정이 없으신가요?"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 15)
    }
    
    private lazy var  registerButton = UIButton().then {
        $0.setTitle("가입하기", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    /// 화면 터치했을 때 텍스트 필드 edit 종료하기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func configUI() {
        loginButton.addTarget(self, action: #selector(loginButtonClicked(_:)), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonClicked(_:)), for: .touchUpInside)
    }
    
    func setLayout() {

        view.addSubViews([logoImage, emailTextField, passwordTextField, forgotPasswordButton, loginButton, registerLabel, registerButton])
        
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(150)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        forgotPasswordButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(15)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgotPasswordButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        registerLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(-30)
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
        }
        
        registerButton.snp.makeConstraints {
            $0.centerY.equalTo(registerLabel)
            $0.leading.equalTo(registerLabel.snp.trailing).offset(10)
        }
    }

    
    @objc
    private func textFieldDidChange(_ sender: AuthTextField) {
        if (emailTextField.hasText && passwordTextField.hasText){
            loginButton.isEnabled = true
        }else{
            loginButton.isEnabled = false
        }
    }
    
    @objc private func loginButtonClicked(_ sender: UIButton){
       
        guard let nextVC = UIStoryboard(name: "Welcome", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else {return}
        self.navigationController?.pushViewController(nextVC, animated: true)
     }
    
    @objc private func registerButtonClicked(_ sender: UIButton){
       
        guard let nextVC = UIStoryboard(name: "RegisterName", bundle: nil).instantiateViewController(withIdentifier: "RegisterNameViewController") as? RegisterNameViewController else {return}
        self.navigationController?.pushViewController(nextVC, animated: true)
     }
    
    
}

//
//  RegisterViewController.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/04/10.
//

import UIKit
import SnapKit
import Then

final class RegisterPasswordViewController: UIViewController {

    var userName: String?

    private let titleLabel = UILabel().then {
        $0.text = "비밀번호 만들기"
        $0.font = .systemFont(ofSize: 25)
        $0.textColor = .black
    }

    private let subTitleLabel = UILabel().then {
        $0.text = "비밀번호를 저장할 수 있으므로 iCloud 기기에서 로그인\n정보를 입력하지 않아도 됩니다."
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .lightGray
    }

    private lazy var passwordTextField = AuthTextField(type: .password, placeHolder: "비밀번호").then {
        $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    private lazy var nextButton = AuthButton(title: "다음").then {
        $0.isEnabled = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func configUI() {
        nextButton.addTarget(self, action: #selector(nextButtonClicked(_:)), for: .touchUpInside)
    }

    func setLayout() {
        view.addSubViews([titleLabel, subTitleLabel, passwordTextField, nextButton])

        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(100)
        }

        subTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }

        passwordTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(20)
        }

        nextButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
        }
    }
    @objc private func nextButtonClicked(_ sender: UIButton){
       
        guard let nextVC = UIStoryboard(name: "RegisterPassword", bundle: nil).instantiateViewController(withIdentifier: "RegisterPasswordViewController") as? RegisterPasswordViewController else {return}
        nextVC.userName = self.userName
        self.navigationController?.pushViewController(nextVC, animated: true)
     }

    @objc
    private func textFieldDidChange(_ sender: UITextField) {
        if passwordTextField.hasText{
            nextButton.isEnabled = true
        }else{
            nextButton.isEnabled = false
        }
    }
}

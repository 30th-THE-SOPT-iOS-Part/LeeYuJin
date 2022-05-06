import UIKit



class AuthTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var visibleButton = UIButton().then{
        $0.setImage(UIImage(named: "icn_password_hidden"), for: .normal)
    }
    
    init(type: textFieldType, placeHolder: String) {
        super.init(frame: .zero)
        setUI()
        
        switch type{
        case .basic:
            self.placeholder = placeHolder
            self.clearButtonMode = .whileEditing
        case .password:
            self.isSecureTextEntry = true
            self.placeholder = placeHolder
            setVisibleButton()
        }
    }
    
    enum textFieldType {
        case basic
        case password
    }

    
    func setUI() {
        self.font = .systemFont(ofSize: 14)
        self.contentVerticalAlignment = .center
        self.backgroundColor = .textfieldFill
        self.layer.borderColor = UIColor.textfieldStroke.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 8
        
        self.addLeftPadding(width: 10)
        
        self.snp.makeConstraints{
            $0.height.equalTo(40)
        }
    }
    
    func setVisibleButton(){
        self.addRightPadding(width: 30)//버튼이 가려지지 않게 오른쪽 패딩 추가
        
        self.addSubview(visibleButton)
        
        self.snp.makeConstraints{
            $0.height.equalTo(44)
        }
        visibleButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-12)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
        }
       
        
        visibleButton.addTarget(self, action:#selector(visibleButtonDidTap(_:)), for: .touchUpInside)
    }
    
    @objc private func visibleButtonDidTap(_ sender: UIButton){
        isSecureTextEntry.toggle()
        switch isSecureTextEntry{
        case true:
            visibleButton.setImage(UIImage(named: "icn_password_hidden"), for: .normal)
        case false:
            visibleButton.setImage(UIImage(named: "icn_password_shown"), for: .normal)
        }
        
     }

}

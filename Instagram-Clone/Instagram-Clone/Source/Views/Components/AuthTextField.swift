import UIKit

enum textFieldType {
    case basic
    case password
}


class AuthTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(type: textFieldType, placeHolder: String) {
        super.init(frame: .zero)
        setUI()
        
        switch type{
        case .basic:
            self.placeholder = placeHolder
        case .password:
            self.isSecureTextEntry = true
            self.placeholder = placeHolder
        }
    }
    
    func setUI() {
        self.font = .systemFont(ofSize: 17)
        self.contentVerticalAlignment = .center
        self.borderStyle = .roundedRect
        self.backgroundColor = .systemGray6
        
        self.snp.makeConstraints{
            $0.height.equalTo(40)
        }
    }

}

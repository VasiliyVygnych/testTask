//
//  AuthController.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 14.03.2024.
//

import UIKit
import SnapKit
import Combine

class AuthController: BaseViewController {
    
    var test = Bool(false)
    var viewModel: AuthViewModelProtocol?
    private var cancelable: Set<AnyCancellable> = []

    @Published var email = ""
    @Published var phoneNumber = ""
    @Published var state = ViewStates.none
    
    var isValidateEmail: AnyPublisher<Bool, Never> {
        $email
            .map { $0.isEmail() }
            .eraseToAnyPublisher()
    }
    var isValidateNumber: AnyPublisher<Bool, Never> {
        $phoneNumber
            .map { $0.isPhoneNumber() }
            .eraseToAnyPublisher()
    }
    var isLoginEnable: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isValidateEmail, isValidateNumber)
            .map { $0 || $1 }
            .eraseToAnyPublisher()
    }
//MARK: - loginView
    private var loginView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "darkGray")
        view.layer.cornerRadius = Constants.CornerRadius.radius_15
        return view
    }()
//MARK: UILabel loginView
    private var loginLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = Constants.Text.textLoginLabel
        label.font = .systemFont(ofSize: 18,
                                 weight: .bold)
        return label
    }()
    private var textFieldLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.text = Constants.Text.textLoginLabel
        label.font = .systemFont(ofSize: 16,
                                 weight: .regular)
        label.text = "Электронная почта или телефон"
        return label
    }()
//MARK: UIImageView
    private var textFieldImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "responses")
        return image
    }()
//MARK: UITextField loginView
    private var emailTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 7
        textField.textColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.backgroundColor = UIColor(named: "basikGray")
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowRadius = 5
        textField.layer.masksToBounds = false
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 2,
                                           height: 4)
        return textField
    }()
//MARK: UIButtons loginView
    private var nextButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.Text.textNextButton,
                        for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "darkBlue")
        button.layer.cornerRadius = Constants.CornerRadius.radius_10
        return button
    }()
    private var loginButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.Text.textLoginButton,
                        for: .normal)
        button.setTitleColor(UIColor(named: "basikBlue"),
                             for: .normal)
        return button
    }()
//MARK: - searchView
    private var searchView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "darkGray")
        view.layer.cornerRadius = Constants.CornerRadius.radius_15
        return view
    }()
//MARK: UILabels searchView
    private var searchLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = Constants.Text.textSearchLabel
        label.font = .systemFont(ofSize: 16,
                                 weight: .bold)
        return label
    }()
    private var searchTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = Constants.Text.textSearchTitle
        label.font = .systemFont(ofSize: 14,
                                 weight: .regular)
        return label
    }()
//MARK: UIButton searchView
    private var searchButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.Text.textSearchButton,
                        for: .normal)
        button.backgroundColor = UIColor(named: "basikGreen")
        button.layer.cornerRadius = Constants.CornerRadius.radius_15
        return button
    }()
//MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        сreatedConstraints()
        setupeButton()
        isLoginEnable
            .assign(to: \.isEnabled,
                    on: nextButton)
            .store(in: &cancelable)
//        emailTextField.text = "Электронная почта или телефон"
    }
//MARK: bindingView
    func bindingView() {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, 
                       object: emailTextField)
            .map { ($0.object as? UITextView)?.text ?? "" }
            .assign(to: \.email, 
                    on: self)
            .store(in: &cancelable)
        $state
            .sink { [weak self] state in
                switch state {
                case .loading:
                    self?.nextButton.isEnabled = false
                case .success:
                    self?.nextButton.isEnabled = true
                    self?.emailTextField.layer.borderColor = UIColor.green.cgColor
                    self?.emailTextField.layer.borderWidth = 1
                    self?.emailTextField.textColor = .white
                case .failed:
                    self?.emailTextField.layer.borderColor = UIColor.red.cgColor
                    self?.emailTextField.layer.borderWidth = 1
                    self?.emailTextField.textColor = .red
                case .none:
                    break
                }
            }
            .store(in: &cancelable)
    }
//MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isUserInteractionEnabled = false
        settingUpTheView(.auth)
    }
//MARK: addSubview
    private func addSubview() {
        view.addSubview(loginView)
        loginView.addSubview(loginLabel)
        loginView.addSubview(emailTextField)
        loginView.addSubview(nextButton)
        loginView.addSubview(loginButton)
        view.addSubview(searchView)
        searchView.addSubview(searchLabel)
        searchView.addSubview(searchTitle)
        searchView.addSubview(searchButton)
        emailTextField.delegate = self
        
        emailTextField.addSubview(textFieldLabel)
        emailTextField.addSubview(textFieldImage)
    }
//MARK: сreatedConstraints
    private func сreatedConstraints() {
        loginView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(232)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.height.equalTo(179)
        }
        loginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.width.greaterThanOrEqualTo(106)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.height.equalTo(25)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).inset(-15)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.height.equalTo(40)
        }
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).inset(-20)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.right.equalTo(emailTextField.snp.centerX)
            make.height.equalTo(40)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).inset(-20)
            make.right.equalTo(-Constants.Constraints.gap_16)
            make.left.equalTo(emailTextField.snp.centerX)
            make.height.equalTo(40)
        }
        searchView.snp.makeConstraints { make in
            make.top.equalTo(loginView.snp.bottom).inset(-20)
            make.width.equalToSuperview().inset(16)
            make.left.equalTo(16)
            make.height.equalTo(141)
        }
        searchLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.width.greaterThanOrEqualTo(100)
            make.left.equalTo(16)
            make.height.equalTo(25)
        }
        searchTitle.snp.makeConstraints { make in
            make.top.equalTo(searchLabel.snp.bottom).inset(-10)
            make.width.equalToSuperview().inset(16)
            make.left.equalTo(16)
            make.height.equalTo(25)
        }
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(searchTitle.snp.bottom).inset(-10)
            make.width.equalToSuperview().inset(16)
            make.left.equalTo(16)
            make.height.equalTo(32)
        }
        textFieldImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(10)
            make.width.height.equalTo(24)
        }
        textFieldLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
//MARK: setupeButton
    private func setupeButton() {
        nextButton.addTarget(self,
                             action: #selector(verification),
                             for: .touchUpInside)
        loginButton.addTarget(self,
                             action: #selector(login),
                             for: .touchUpInside)
        searchButton.addTarget(self,
                             action: #selector(search),
                             for: .touchUpInside)
    }
}
extension AuthController {
   @objc func verification() {
       viewModel?.clickAnimate(button: nextButton)
       if state == .success {
           viewModel?.presentView()
       } else {
           bindingView()
       }
    }
    @objc func login() {
        viewModel?.clickAnimate(button: loginButton)
        //
     }
    @objc func search() {
        viewModel?.clickAnimate(button: searchButton)
        //
     }
}
extension AuthController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                  shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range,
                                                               with: string)
        emailTextField.text = newString
        UserDefaults.standard.set(newString, 
                                  forKey: "email")
        textFieldLabel.isHidden = true
        textFieldImage.isHidden = true
        if newString.count > 1 {
            nextButton.backgroundColor = UIColor(named: "basikBlue")
            nextButton.isEnabled = true
        } else {
            nextButton.backgroundColor = UIColor(named: "darkBlue")
            nextButton.isEnabled = false
        }
        if text.chekEmail() {
            self.state = .success
        } else {
            self.state = .failed
        }
     return false
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

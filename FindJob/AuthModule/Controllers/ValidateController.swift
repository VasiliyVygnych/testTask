//
//  ValidateController.swift
//  FindJob
//
//  Created by Vasiliy Vygnych on 14.03.2024.
//

import UIKit
import SnapKit
import Combine

class ValidateController: BaseViewController {
    
    var viewModel: AuthViewModelProtocol?
  
    private var firstTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = Constants.CornerRadius.radius_15
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(named: "basikGray")
        textField.textAlignment = .center
        return textField
    }()
    private var secondTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = Constants.CornerRadius.radius_15
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(named: "basikGray")
        textField.textAlignment = .center
        return textField
    }()
    private var thirdTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = Constants.CornerRadius.radius_15
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(named: "basikGray")
        textField.textAlignment = .center
        return textField
    }()
    private var fourthTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = Constants.CornerRadius.radius_15
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.backgroundColor = UIColor(named: "basikGray")
        return textField
    }()
//MARK: UIView
    private var validateView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = Constants.CornerRadius.radius_15
        return view
    }()
//MARK: UILabel
    private var validateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18,
                                 weight: .bold)
        label.text = Constants.Text.textValidateLabel
        return label
    }()
    private var emailLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18,
                                 weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    private var validateTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.text = Constants.Text.textValidateTitle
        label.font = .systemFont(ofSize: 16,
                                 weight: .regular)
        return label
    }()
//MARK: UIButton
    private var confirmationButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.Text.textConfirmationButton,
                        for: .normal)
        button.backgroundColor = UIColor(named: "darkBlue")
        button.layer.cornerRadius = Constants.CornerRadius.radius_10
        return button
    }()
//MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        сreatedConstraints()
        setupeButton()
        confirmationButton.isEnabled = false
        emailLabel.text = UserDefaults.standard.string(forKey: "email")
    }
//MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        settingUpTheView(.none)
        tabBarController?.tabBar.isUserInteractionEnabled = false
    }
//MARK: addSubview
    func addSubview() {
        view.addSubview(validateView)
        validateView.addSubview(confirmationButton)
        validateView.addSubview(validateLabel)
        validateView.addSubview(emailLabel)
        validateView.addSubview(validateTitle)
        validateView.addSubview(firstTextField)
        validateView.addSubview(secondTextField)
        validateView.addSubview(thirdTextField)
        validateView.addSubview(fourthTextField)
        firstTextField.text = "*"
        firstTextField.textColor = UIColor(named: "lightBasikGray")
        secondTextField.text = "*"
        secondTextField.textColor = UIColor(named: "lightBasikGray")
        thirdTextField.text = "*"
        thirdTextField.textColor = UIColor(named: "lightBasikGray")
        fourthTextField.text = "*"
        fourthTextField.textColor = UIColor(named: "lightBasikGray")
        firstTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
        fourthTextField.delegate = self
    }
//MARK: сreatedConstraints
    func сreatedConstraints() {
        validateView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(162)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.left.equalTo(Constants.Constraints.gap_16)
            make.height.equalTo(225)
        }
        validateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(170)
            make.height.greaterThanOrEqualTo(24)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(validateLabel.snp.right).inset(-10)
            make.width.equalToSuperview().inset(Constants.Constraints.gap_16)
            make.height.greaterThanOrEqualTo(24)
        }
        validateTitle.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).inset(-10)
            make.width.equalToSuperview()
            make.height.greaterThanOrEqualTo(57)
        }
        firstTextField.snp.makeConstraints { make in
            make.top.equalTo(validateTitle.snp.bottom).inset(-10)
            make.width.height.equalTo(48)
            make.left.equalToSuperview()
        }
        secondTextField.snp.makeConstraints { make in
            make.top.equalTo(validateTitle.snp.bottom).inset(-10)
            make.width.height.equalTo(48)
            make.left.equalTo(firstTextField.snp.right).inset(-10)
        }
        thirdTextField.snp.makeConstraints { make in
            make.top.equalTo(validateTitle.snp.bottom).inset(-10)
            make.width.height.equalTo(48)
            make.left.equalTo(secondTextField.snp.right).inset(-10)
        }
        fourthTextField.snp.makeConstraints { make in
            make.top.equalTo(validateTitle.snp.bottom).inset(-10)
            make.width.height.equalTo(48)
            make.left.equalTo(thirdTextField.snp.right).inset(-10)
        }
        confirmationButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(48)
            make.bottom.equalToSuperview()
        }
    }
//MARK: setupeButton
    func setupeButton() {
        backButtonNavBar(with: #selector(popToView), 
                         image: UIImage(systemName: "chevron.left"),
                         tintColor: .white)
        confirmationButton.addTarget(self,
                                     action: #selector(confirmation),
                                     for: .touchUpInside)
    }
}
extension ValidateController {
    @objc func popToView() {
        navigationController?.popViewController(animated: true)
    }
    @objc func confirmation() {
        viewModel?.clickAnimate(button: confirmationButton)
        viewModel?.presentSearchView()
    }
}
extension ValidateController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range,
                                                               with: string)
        if textField == firstTextField {
            secondTextField.becomeFirstResponder()
            firstTextField.text = textField.text?.addingMask(value: newString,
                                                             mask: "*")
        }
        if textField == secondTextField {
            thirdTextField.becomeFirstResponder()
            secondTextField.text = textField.text?.addingMask(value: newString,
                                                              mask: "*")
            if textField.text == "" {
                firstTextField.becomeFirstResponder()
            }
        }
        if textField == thirdTextField {
            fourthTextField.becomeFirstResponder()
            thirdTextField.text = textField.text?.addingMask(value: newString,
                                                             mask: "*")
            if textField.text == "" {
                secondTextField.becomeFirstResponder()
            }
        }
        if textField == fourthTextField {
            fourthTextField.text = textField.text?.addingMask(value: newString,
                                                              mask: "*")
            if textField.text == "" {
                thirdTextField.becomeFirstResponder()
            }
            confirmationButton.isEnabled = true
            confirmationButton.backgroundColor = UIColor(named: "basikBlue")
        }
       return false
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

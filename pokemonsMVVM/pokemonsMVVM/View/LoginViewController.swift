//
//  LoginViewController.swift
//  pokemonsMVVM
//
//  Created by Ivan Pavic on 24.6.22..
//

import UIKit
import SnapKit
import IHKeyboardAvoiding

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var userNameTextField: LogInTextField!
    var passwordTextField: LogInTextField!
    var loginButton: LogInButton!
    private var loginViewModel: LoginViewModel!
    private var parameters = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        navigationItem.hidesBackButton = true
        KeyboardAvoiding.avoidingView = self.view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func logInButtonTapped() {
        guard let username = userNameTextField.text,
              let password = passwordTextField.text else { return }
        loginViewModel = LoginViewModel()
        parameters = [TitlesAndStrings.email: username, TitlesAndStrings.password: password]
        
        loginViewModel.authenticate(parameters: parameters)
        loginViewModel.bindLoginVMToController = {
            let isLogedIn = self.loginViewModel.user?.success ?? false
            if isLogedIn {
                self.pushPokemonsViewController(userData: self.loginViewModel.user.data)
            } else {
                self.alertFailedLogin()
            }
        }
    }
    
    func pushPokemonsViewController(userData: UserData) {
        DispatchQueue.main.async { [weak self] in
            let vc = PokemonsViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
            self?.userNameTextField.text = nil
            self?.passwordTextField.text = nil
        }
        save(userData: userData)
    }
    
    func alertFailedLogin() {
        DispatchQueue.main.async { [weak self] in
            let ac = UIAlertController(title: TitlesAndStrings.alertTitle, message: TitlesAndStrings.alertMessage, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: TitlesAndStrings.alertActionTitle, style: .default))
            self?.present(ac, animated: true)
            self?.passwordTextField.text = nil
        }
    }
    
    func setupViews() {
        userNameTextField = LogInTextField()
        userNameTextField.configure(placeHolder: TitlesAndStrings.usernamePlaceholder, delegate: self)
        view.addSubview(userNameTextField)
        
        passwordTextField = LogInTextField()
        passwordTextField.configure(placeHolder: TitlesAndStrings.passwordPlaceholder, delegate: self)
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        
        loginButton = LogInButton(type: .system)
        loginButton.configure()
        loginButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(OffsetsAndInsets.loginButtonBottom)
            make.top.equalTo(passwordTextField.snp.bottom).offset(OffsetsAndInsets.loginButtonTop)
            make.height.equalTo(Dimensions.logInButtonHeight)
            make.width.equalTo(Dimensions.logInButtonWidth)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(OffsetsAndInsets.passwordTFTop)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(OffsetsAndInsets.passwordTFLeading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(OffsetsAndInsets.passwordTFTrailing)
            make.height.equalTo(Dimensions.textFieldHeight)
        }
        userNameTextField.snp.makeConstraints { make in
            make.centerX.equalTo(passwordTextField.snp.centerX)
            make.height.width.equalTo(passwordTextField)
        }
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    func save(userData: UserData) {
        let encoder = JSONEncoder()
        guard let encodedData = try? encoder.encode(userData) else { return }
        let defaults = UserDefaults.standard
        defaults.set(encodedData, forKey: TitlesAndStrings.defaultsKey)
    }
    
}

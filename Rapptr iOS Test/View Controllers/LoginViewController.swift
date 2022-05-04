//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Actions
    @IBAction func didPressLoginButton(_ sender: Any) {
        
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else { return }
        
        LoginClient.login(email: email, password: password) { [weak self] (message) in
            
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Login is successful!", message: "\(message)\n", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
                    self?.navigationController?.popToRootViewController(animated: true)})
                alert.addAction(okAction)
                self?.present(alert, animated: true)
            }
        }
    }
    
    // MARK: - Helper Methods
    func updateViews() {
        title = "Login"
        hideKeyboardWhenTappedAround()
    }
}

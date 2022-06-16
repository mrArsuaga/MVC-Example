//
//  LoginViewController.swift
//  MVC Example
//
//  Created by Jose Arsuaga on 11/06/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.addTarget(self, action: #selector(validateTextFields), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(validateTextFields), for: .editingChanged)
    }
    
    @objc private func validateTextFields() {
        //Homework add a new validation to validate if the email field is actually an email
        loginButton.isEnabled = emailTextField.text != "" && passwordTextField.text != ""
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func goToHomeViewController() {
        guard let homeViewController = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return }
        present(homeViewController, animated: true, completion: nil)
    }
    
    private func showSpinner() {
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    private func removeSpinner() {
        activityIndicator.removeFromSuperview()
    }
    
    private func createErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Invalid credentials", preferredStyle: .alert)
        let action = UIAlertAction(title: "Accept", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginButtonTapped() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        self.showSpinner()
        NetworkService.shared.login(email: email, password: password) { [weak self] success in
            self?.removeSpinner()
            if success {
                self?.goToHomeViewController()
            } else {
                self?.createErrorAlert()
            }
        }
    }
}


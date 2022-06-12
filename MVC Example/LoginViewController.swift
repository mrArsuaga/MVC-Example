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
    @IBOutlet weak var loginButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.addTarget(self, action: #selector(self.validateFields), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(self.validateFields), for: .editingChanged)
    }
    
    @objc private func validateFields() {
        loginButton.isEnabled = !(emailTextField.text?.isEmpty ?? false) && !(passwordTextField.text?.isEmpty ?? false)
    }
    
    @IBAction func loginButtonTapped() {
        
    }


}


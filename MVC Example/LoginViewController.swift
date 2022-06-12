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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginButtonTapped() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        NetworkService.shared.login(email: email,
                                    password: password) { success in
            if success {
                self.goToHomePage()
            } else {
                print("invalid credentials")
            }
            
        }
    }
    
    private func goToHomePage() {
        guard let homeController = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return }
        self.present(homeController, animated: true, completion: nil)
    }


}


//
//  LoginViewController.swift
//  Trader
//
//  Created by admin on 1.05.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginModel: LoginModel? {
        didSet {
            self.hideActivityIndicator()
            if loginModel?.result.state == true {
                
                // Save to UserDefaults for use in portfolio api call
                let defaults = UserDefaults.standard
                defaults.set(loginModel?.defaultAccount, forKey: "defaultAccount")
                defaults.set(self.userNameTextField.text, forKey: "userName")
                defaults.set(self.passwordTextField, forKey: "password")
                
                // Go to Portfolio View Controller
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PortfolioViewController") as! PortfolioViewController
                self.present(vc, animated: true, completion: nil)
            }
            else {
                // Show alert
                let alert = UIAlertController(title: "Giris Basarisiz", message: loginModel?.result.resultDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "TAMAM", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    
    var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        showActivityIndicator()
        login(userName: self.userNameTextField.text ?? "", password: self.passwordTextField.text ?? "")
    }
}

// API Call Extension
extension LoginViewController {
    
    func login(userName: String, password: String) {
        ConnectionManager().setBaseUrl(url: HttpLink.mainURL.rawValue)
            .setMethod(method: .get)
            .setBodyParameter(parameter:
                ParameterBuilder()
                .setMsgType("A")
                .setUsername(userName)
                .setPassword(password)
                .setAccountID("0")
                .setExchangeID("4")
                .setOutputType("2")
                .createParameters())
            .sendRequest { (response) in
                
                switch response {
                case .success(let data):
                    do {
                        self.loginModel = try JSONDecoder().decode(LoginModel.self, from: data)
                    } catch { print(error) }
                    
                case .failure(let error):
                    print(error)
                }
        }
    }
}

// Activity Indicator Extension
extension LoginViewController {
    
    func showActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator?.center = self.view.center
        self.view.addSubview(activityIndicator!)
        activityIndicator?.startAnimating()
    }
    
    func hideActivityIndicator() {
        if activityIndicator != nil {
            activityIndicator?.stopAnimating()
        }
    }
}

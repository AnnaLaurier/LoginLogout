//
//  ViewController.swift
//  LoginLogout
//
//  Created by Anna Lavrova on 06.02.2024.
//

import UIKit

class ViewController: UIViewController {

    private let login = "user"
    private let password = "1234"

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 16
        loginButton.layer.cornerCurve = .continuous
        loginButton.setTitle("Login", for: .normal)

        loginTextField.placeholder = "Enter your login"
        loginTextField.returnKeyType = .continue

        passwordTextField.placeholder = "Enter your password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardType = .numberPad

        forgotPasswordButton.setTitle("Forgot your login or password?", for: .normal)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        let tabBar = segue.destination as? UITabBarController
        let profileViewController = tabBar?.viewControllers?.first(
            where: { $0 is ProfileViewController }
        ) as? ProfileViewController

        profileViewController?.userName = login

        let homeViewController = tabBar?.viewControllers?.first(
            where: { $0 is HomeViewController }
        ) as? HomeViewController

        homeViewController?.userName = login
    }

    @IBAction func onLoginButtonTapped() {
        guard loginTextField.text != login || passwordTextField.text != password else {
            return
        }

        let alert = UIAlertController(
            title: "Login or password failed",
            message: nil,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { [weak self] _ in
                self?.passwordTextField.text = nil
            }
        )
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    @IBAction func forgotButtonTapped() {
        let alert = UIAlertController(
            title: nil,
            message: "Login: \(login)\nPassword: \(password)",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { [weak self] _ in
                self?.loginTextField.becomeFirstResponder()
            }
        )
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

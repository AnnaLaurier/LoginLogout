//
//  HomeViewController.swift
//  LoginLogout
//
//  Created by Anna Lavrova on 08.02.2024.
//

import UIKit

class HomeViewController: UIViewController {

    var userName: String? = nil

    @IBOutlet weak var informationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let userName {
            informationLabel.text = "Привет, \(userName)!\nПрила создана 08.02 :)"
        }
    }
}

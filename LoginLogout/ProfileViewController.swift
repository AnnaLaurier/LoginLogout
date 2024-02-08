//
//  ProfileViewController.swift
//  LoginLogout
//
//  Created by Anna Lavrova on 06.02.2024.
//

import UIKit

class ProfileViewController: UIViewController {

    var userName: String? = nil

    @IBOutlet private weak var profileLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        profileLabel.text = userName
    }
}


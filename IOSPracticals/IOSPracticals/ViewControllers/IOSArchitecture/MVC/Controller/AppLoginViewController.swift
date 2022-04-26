//
//  AppLoginViewController.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 08/04/22.
//

import UIKit

class AppLoginViewController: UIViewController, Storyboarded {

    //MARK: - Variables
    var coordinator: MVCCoordinator?
    
    //MARK: - Outlets
    @IBOutlet weak var lblEmail: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTitleWithDefaultBackButton(title: "MVC Architecture")
    }
    
    //MARK: - Actions
    @IBAction func loginValidateAction(_ sender: UIButton) {
        guard let email = lblEmail.text else { return }
        guard let password = lblPassword.text else { return }
        
        if (email.isEmpty || password.isEmpty) {
            return
        } else {
            let userData = LoginData(email: email, password: password)
            coordinator?.loginSuccess(userData)
        }
    }
    
}//End of class

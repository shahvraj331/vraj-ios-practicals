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
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTitleWithDefaultBackButton(title: "MVC Architecture")
    }
    
    //MARK: - Actions
    @IBAction func loginValidateAction(_ sender: UIButton) {
        guard let email = txtEmail.text else { return }
        guard let password = txtPassword.text else { return }
        
        if (email.isEmpty || password.isEmpty) {
            return
        } else {
            let userData = LoginData(email: email, password: password)
            coordinator?.loginSuccess(userData)
        }
    }
    
}//End of class

//MARK: - UITextFieldDelegate
extension AppLoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtEmail {
            textField.resignFirstResponder()
            txtPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}//End of extension

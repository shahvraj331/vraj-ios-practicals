//
//  LoginSuccessViewController.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 08/04/22.
//

import UIKit

class LoginSuccessViewController: UIViewController, Storyboarded {

    //MARK: - Variables
    var coordinator: MVCCoordinator?
    var userData: LoginData?
    
    //MARK: - Outlets
    @IBOutlet weak var lblUserData: UILabel!
    
    //MARK: - UIViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    //MARK: - file private functions
    fileprivate func initUI() {
        guard let userData = userData else {
            return
        }
        lblUserData.text = "Login success: \n" + "Email: " + userData.email
    }

}//End of class

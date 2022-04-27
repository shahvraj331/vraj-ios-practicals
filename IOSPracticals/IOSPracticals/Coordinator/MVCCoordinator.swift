//
//  MVCCoordinator.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 08/04/22.
//

import Foundation
import UIKit

class MVCCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init (_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        let loginVC = AppLoginViewController.instantiate(from: .mvcArchitecture)
        loginVC.coordinator = self
        navController?.pushViewController(loginVC, animated: true)
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navController?.popToRootViewController(animated: true)
    }
    
    func loginSuccess(_ userData: LoginData) {
        let successVC = LoginSuccessViewController.instantiate(from: .mvcArchitecture)
        successVC.userData = userData
        navController?.pushViewController(successVC, animated: true)
    }
    
}//End of class

//
//  AuthenticationCoordiantor.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 25/03/22.
//

import UIKit

class AuthenticationCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init (_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        let loginVC = LoginViewController.instantiate(from: .basicAutoLayout)
        loginVC.coordinator = self
        navController?.pushViewController(loginVC, animated: true)
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navController?.popToRootViewController(animated: true)
    }
    
    func startUsersListVC() {
        let usersListVC = UsersListViewController.instantiate(from: .webService)
        usersListVC.coordinator = self
        navController?.pushViewController(usersListVC, animated: true)
    }
    
    func startSingleUserVC(_ index: Int) {
        let singleUserVC = SingleUserViewController.instantiate(from: .webService)
        singleUserVC.coordinator = self
        singleUserVC.selectedUserIndex = index
        navController?.pushViewController(singleUserVC, animated: true)
    }
    
    func presentAddUser() {
        let addUserVC = AddUserViewController.instantiate(from: .webService)
        addUserVC.modalPresentationStyle = .custom
        addUserVC.modalTransitionStyle = .crossDissolve
        navController?.present(addUserVC, animated: true)
    }
    
}//End of class


//
//  ChatCoordinator.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 21/04/22.
//

import Foundation
import UIKit
import RxSwift

class DependencyCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init (_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        let firstUser = FirstUserViewController.instantiate(from: .chatStoryboard)
        firstUser.coordinator = self
        navController?.pushViewController(firstUser, animated: true)
    }
    
    func goToFirstUser(_ secondUserVC: ChatProtocol) {
//        let firstUser = FirstUserViewController.instantiate(from: .chatStoryboard)
//        firstUser.coordinator = self
//        firstUser.messageObserver.subscribe(onNext: { message in
//            secondUserVC.updateMessage(message: message)
//        }).dispose()
//        navController?.popViewController(animated: true)
    }
    
    func goToSecondUser(_ firstUserVC: ChatProtocol) {
        let secondUser = SecondUserViewController.instantiate(from: .chatStoryboard)
        secondUser.coordinator = self
        secondUser.messageObserver.subscribe(onNext: { message in
            firstUserVC.updateMessage(message: message)
        }).disposed(by: DisposeBag())
        navController?.pushViewController(secondUser, animated: true)
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navController?.popToRootViewController(animated: true)
    }
    
}

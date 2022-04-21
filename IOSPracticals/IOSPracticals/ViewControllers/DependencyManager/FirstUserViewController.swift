//
//  FirstUserViewController.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 21/04/22.
//

import UIKit
import RxSwift
import RxRelay

protocol ChatProtocol {
    func updateMessage(message: String)
}

class FirstUserViewController: UIViewController, Storyboarded {

    //MARK: - Outlets
    @IBOutlet weak var lblMessageFromSecond: UILabel!
    @IBOutlet weak var tfMessageToSecond: UITextField!
    
    //MARK: - Variables
    var coordinator: DependencyCoordinator?
//    let messageFromFirst = BehaviorRelay(value: "")
//    var messageObserver: Observable<String> {
//        return messageFromFirst.asObservable()
//    }
    
    //MARK: - UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    //MARK: - Actions
    @IBAction func sendMessageAction(_ sender: Any) {
//        guard let message = tfMessageToSecond.text?.trimmingCharacters(in: .whitespaces) else { return }
//        messageFromFirst.accept(message)
//        coordinator?.goToSecondUser(self)
        let secondUser = SecondUserViewController.instantiate(from: .chatStoryboard)
        secondUser.messageObserver.subscribe(onNext: { message in
            self.updateMessage(message: message)
        }).disposed(by: DisposeBag())
        self.navigationController?.pushViewController(secondUser, animated: true)
    }
    
    //MARK: - File private functions
    fileprivate func initUI() {
        self.navigationItem.title = "First User"
        self.navigationItem.backButtonTitle = "Back"
    }
    
}//End of class

//MARK: - chat protocol
extension FirstUserViewController: ChatProtocol {
    
    func updateMessage(message: String) {
        lblMessageFromSecond.text = message
    }
    
}//End of extension

//
//  SecondUserViewController.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 21/04/22.
//

import UIKit
import RxSwift
import RxRelay

class SecondUserViewController: UIViewController, Storyboarded {

    //MARK: - Outlets
    @IBOutlet weak var lblMessageFromFirst: UILabel!
    @IBOutlet weak var tfMessageToFirst: UITextField!
    
    //MARK: - Variables
    var coordinator: DependencyCoordinator?
    let messageFromSecond = BehaviorRelay(value: "")
    var messageObserver: Observable<String> {
        return messageFromSecond.asObservable()
    }
    
    //MARK: - UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    //MARK: - Actions
    @IBAction func sendMessageAction(_ sender: Any) {
        guard let message = tfMessageToFirst.text?.trimmingCharacters(in: .whitespaces) else { return }
        messageFromSecond.accept(message)
//        coordinator?.finish()
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - File private functions
    fileprivate func initUI() {
        self.navigationItem.title = "Second User"
        self.navigationItem.backButtonTitle = "Back"
    }
    
}//End of class

//MARK: - chat protocol
extension SecondUserViewController: ChatProtocol {
    
    func updateMessage(message: String) {
        lblMessageFromFirst.text = message
    }
    
}//End of extension

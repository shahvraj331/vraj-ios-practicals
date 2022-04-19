//
//  AddUserViewController.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 28/03/22.
//

import UIKit

class AddUserViewController: UIViewController, Storyboarded {
    
    //MARK: - Variables
    let viewModel = BaseViewModel()
    
    //MARK: - Outlets
    @IBOutlet weak var tfNameOfUser: UITextField!
    @IBOutlet weak var tfJobOfUser: UITextField!
    @IBOutlet weak var dialogView: UIView!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        bindViewModel()
    }
    
    //MARK: - Actions
    @IBAction func btnAddUser(_ sender: Any) {
        addNewUser()
    }
    
    @IBAction func btnCloseDialog(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    //MARK: - File private functions
    fileprivate func bindViewModel() {
        viewModel.onAddUserFetchSuccess = { [weak self] responseData in
            guard let self = self else { return }
            guard let responseData = responseData else { return }
            Validation.showToast(controller: self, message: "User added: \n \(responseData)", seconds: 2.0)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
                self.dismiss(animated: true)
            }
        }
    }
    
    fileprivate func initializeView() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        dialogView.layer.cornerRadius = 5.0
    }
    
    fileprivate func addNewUser() {
        if let name = tfNameOfUser.text?.trimmingCharacters(in: .whitespaces), let job = tfJobOfUser.text?.trimmingCharacters(in: .whitespaces) {
            if (name.isEmpty || job.isEmpty) {
                Validation.showToast(controller: self, message: "Enter proper credentials", seconds: 1.5)
            } else {
                viewModel.addSingleUser(name: name, job: job)
            }
        }
    }
    
}//End of class

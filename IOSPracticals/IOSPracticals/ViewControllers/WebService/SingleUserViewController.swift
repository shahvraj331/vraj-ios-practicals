//
//  SingleUserViewController.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 25/03/22.
//

import UIKit
import Alamofire

class SingleUserViewController: UIViewController, Storyboarded {

    //MARK: - Variables
    var coordinator: AuthenticationCoordinator?
    var selectedUserIndex: Int?
    
    //MARK: - Outlets
    @IBOutlet weak var ivImageOfUser: UIImageView!
    @IBOutlet weak var lblIdOfUser: UILabel!
    @IBOutlet weak var lblFullNameOfUser: UILabel!
    @IBOutlet weak var lblEmailOfUser: UILabel!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        getSingleUser()
    }
    
    //MARK: - File private functions
    fileprivate func getSingleUser() {
        if let selectedUserIndex = selectedUserIndex {
            AlamofireRequest.getSingleUser(controller: self, selectedUserIndex: selectedUserIndex) { [weak self] responseData in
                guard let self = self else { return }
                guard let responseData = responseData else { return }
                if let url = URL(string: responseData.data.avatar) {
                    guard let data = try? Data(contentsOf: url) else { return }
                    self.ivImageOfUser.image = UIImage(data: data)
                }
                self.lblFullNameOfUser.text = responseData.data.firstName + " " + responseData.data.lastName
                self.lblIdOfUser.text = "ID: " + String(responseData.data.userID)
                self.lblEmailOfUser.text = responseData.data.email
            }
        }
    }
    
}//End of class

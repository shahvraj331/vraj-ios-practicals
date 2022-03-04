import UIKit

class SuccessViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var lblSuccessText: UILabel!
    
    //MARK: - Variables
    var userData: [String: String] = [:]
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        onSuccessSignUp()
    }
    
}//End of class

//MARK: - File private funstions
extension SuccessViewController {
    
    func onSuccessSignUp() {
        if let fullName = userData["FullName"], let email = userData["Email"], let password = userData["Password"] {
            var currentData = "FullName: " +  fullName + "\n"
            currentData += "Email: " + email + "\n"
            currentData += "Password: " + password
            self.lblSuccessText.text = currentData
        } else if let email = userData["Email"], let password = userData["Password"] {
            var currentData = "Email: " + email + "\n"
            currentData += "Password: " + password
            self.lblSuccessText.text = currentData
        }
    }
    
}//End of extension

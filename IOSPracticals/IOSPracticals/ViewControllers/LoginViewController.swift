import UIKit

class LoginViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var lblGoToSignUpVC: UILabel!
    @IBOutlet weak var ivGoogleLogo: UIImageView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    //MARK: - UIViewControllers
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    //MARK: - Actions
    @IBAction func goToHomeScreen(_ sender: UIButton) {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SuccessViewController") as? SuccessViewController {
            let email = tfEmail.text?.trimmingCharacters(in: .whitespaces)
            let password = tfPassword.text?.trimmingCharacters(in: .whitespaces)
            var userData:[String: String] = [:]
            if let userEmail = email, let userPassword = password {
                if (Validation.isValidEmail(userEmail)) {
                    userData = ["Email": userEmail, "Password": userPassword]
                    viewController.userData = userData
                    self.navigationController?.pushViewController(viewController, animated: true)
                } else {
                    Validation.showToast(controller: self, message: "Email not valid", seconds: 1.5)
                }
            }
        }
    }
    
}//End of class

//MARK: - File private functions
extension LoginViewController {
    
    fileprivate func initializeView() {
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToSignUpVC(_: )))
        lblGoToSignUpVC.addGestureRecognizer(guestureRecognizer)
        ivGoogleLogo.layer.borderColor = UIColor.gray.cgColor
        ivGoogleLogo.layer.borderWidth = 0.5
    }
    
    @objc fileprivate func goToSignUpVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}//End of extension
